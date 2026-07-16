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


module Mux_2_To_1(
        S,
        D1,
        D2,
        Y
    );
    
    //Define the input and output signals 
    input S; 
    input D1;
    input D2;
    output Y;
    
    //Define the modules behaviour
 assign Y=(S==1'b0)? D1:
         D2;    
endmodule
