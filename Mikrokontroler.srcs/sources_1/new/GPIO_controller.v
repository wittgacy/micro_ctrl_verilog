`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.06.2016 20:56:13
// Design Name: 
// Module Name: GPIO_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Simple 8-bit GPIO driver 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module GPIO_controller(
clk, 
Data_Bus, 
Ctrl_Bus, 
Output_Bus
);
    
parameter BusWidth = 8; // 8bit by default 
    
input  clk; 
input  [BusWidth-1:0] Data_Bus; 
input  [BusWidth-1:0] Ctrl_Bus; 

output [BusWidth-1:0] Output_Bus;    


always @(posedge clk) begin 


end 
    
    
always @ (*) begin 

end 
    
endmodule
