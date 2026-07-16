`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2026 04:13:46 PM
// Design Name: 
// Module Name: mux21
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


module Mux_4_To_1(
        input [1:0]S,
        input D1,
        input D2,
        input D3,
        input D4,
        output Y
    );
    
    
    //Define the modules behaviour
 assign Y=(S==2'b00)? D1:
        (S==2'b01)? D2:   
        (S==2'b10)? D3:
        D4;  
endmodule
