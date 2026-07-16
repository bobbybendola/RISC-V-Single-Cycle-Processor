`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2026 12:44:21 PM
// Design Name: 
// Module Name: tb_FA
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


module tb_FA4();
    reg [3:0] A_tb = 0;
    reg [3:0] B_tb=0;
    reg Cin_tb=0;
    wire [3:0] Sum_tb;
    wire Cout_tb;
        //Port_Mapping
    FA4 instant
    (
        .A(A_tb),
        .B(B_tb),
	    .Cin(Cin_tb),
        .Sum(Sum_tb),
        .Final_Cout(Cout_tb)
     );
   
  //Test Samples
  initial  //initial block executes only once
  begin
    //Test 1 
    A_tb=4'b0110;
    B_tb=4'b0100;
    Cin_tb=1'b0;
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 2
    A_tb=4'b1000;
    B_tb=4'b1001;
    Cin_tb=1'b1;
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 3
    A_tb=4'b1110;
    B_tb=4'b0010;
    Cin_tb=1'b0;
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 4
    A_tb=4'b1010;
    B_tb=4'b1011;
    Cin_tb=1'b0;
    #20;  //wait for 20 time units (20ns in this case)  
    
  end
  
endmodule  //FA_tb

