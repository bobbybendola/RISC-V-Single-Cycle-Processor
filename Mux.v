`timescale 1ns / 1ps
module Mux_2_To_1(
        S,
        D1,
        D0,
        Y
    );
    
    //Define the input and output signals 
    input S; 
    input [31:0] D1;
    input [31:0] D0;
    output [31:0] Y;
    
    //Define the modules behaviour
 assign Y=(S==1'b0)? D0:D1;    
endmodule