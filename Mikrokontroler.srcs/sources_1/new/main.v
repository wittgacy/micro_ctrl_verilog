`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2016 19:24:26
// Design Name: 
// Module Name: main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main(
Instruction_bus, 
Data_bus, 
clk, 
reset, 
Output_Bank1, 
Output_Bank2, 
Output_Bank3, 
Output_Bank4
);

parameter BusWidth = 8; // Microcontroler is 8bit by default

input [BusWidth-1:0] Instruction_bus; 
input [BusWidth-1:0] Data_bus; 
input clk; 
input reset; 

output [BusWidth-1:0] Output_Bank1; 
output [BusWidth-1:0] Output_Bank2; 
output [BusWidth-1:0] Output_Bank3; 
output [BusWidth-1:0] Output_Bank4;


// Microcontroler registers 

reg [BusWidth-1:0] ProgramCounter; 
reg [5:0] Intruction_register; // Space for Only 63
reg [BusWidth-1:0] Accumulator; // Store of Variables 


// Timer Control Signals 
reg [BusWidth-1:0] Timer_Ctrl_Bus; 
reg [BusWidth-1:0] Counter_Output_bus; 
reg TimerInterrupt; 

// Module of Simple 8-bit Timer 
Timer #(.BusWidth(BusWidth)) SimpleTimer(
.clk(clk),
.Ctrl_bus(Timer_Ctrl_Bus), 
.Output_bus(Counter_Output_bus), 
.Interrupt(TimerInterrupt)
);


always @ (posedge clk) begin 
if(reset == 1) begin 

end 
else begin  

end 


end 

endmodule
