`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2016 20:00:30
// Design Name: 
// Module Name: Timer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Simple 8bit Programmable Timer  
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Timer(
clk, 
Ctrl_bus, 
Output_bus, 
Interrupt 
);

parameter BusWidth = 8; 

input                 clk; 
input  [BusWidth-1:0] Ctrl_bus; 
input  [BusWidth-1:0] Data_bus;  

output [BusWidth-1:0] Output_bus;
output Interrupt; 
// Timer State Machine Names 
localparam Idle     = 0;
localparam Counting = 1; 

// Timer Control Register Names 
localparam Prescaler = 1; 
localparam Ctrl_register = 2;
localparam Counter_value = 3;  
// Control register bits 
localparam Ctrlreg_Continuous = 0;
localparam Ctrlreg_Start = 1; 
 
reg [BusWidth-1:0] Timer_registers [1:0];
reg [BusWidth-1:0] Counter;  

reg nextstate   = 0; 
reg actualstate = Idle; 
always @ ( posedge clk) begin 
   if (Ctrl_bus != 0) begin 
      Timer_registers [Ctrl_bus] = Data_bus; 
   end 
   
   if  (Timer_registers[Ctrl_bus][Ctrlreg_Start] == Counting) actualstate = Counting; 
   else actualstate = nextstate;  
   
end 


always @ (*) begin 
    
    case (actualstate)  
    
           Idle :   begin
                    nextstate = Idle;
                    Interrupt = 0;  
           end 
    
           Counting : begin 
                 if (Counter < Timer_registers[Prescaler]) begin 
                    Counter = Counter + 1;
                    nextstate = Counting; 
                 end
                 else begin 
                      Counter = 0;
                      Interrupt = 1; 
                       if (Timer_registers[Ctrl_reg][Ctrlreg_Continuous]) nextstate = Counting; 
                       else nextstate = Idle; 
                  end   
           end 
           
           default : nextstate = Idle; 
    
    endcase; 
    
end 

assign Output_bus = Counter; 
assign Interrupt = Interrupt; 

endmodule
