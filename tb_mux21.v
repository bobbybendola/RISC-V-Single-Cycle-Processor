`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2026 04:30:14 PM
// Design Name: 
// Module Name: tb_mux21
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


module tb_mux21();
    
    reg tb_S=0;
    reg tb_D1=0;
    reg tb_D2=0;
    wire tb_Y;
    
    //Port_Mapping
    Mux_2_To_1 instant
    (
        .S(tb_S),
        .D1(tb_D1),
	    .D2(tb_D2),
        .Y(tb_Y)
     );
     
  //Test Samples
  initial  //initial block executes only once
  begin
    //Test 1 
    tb_S=1'b0;
    tb_D1=1'b0;
    tb_D2=1'b1; 
    #20;  //wait for 20 time units (20ns in this case)
    
    //Test 2
    tb_S=1'b1;
    tb_D1=1'b0;
    tb_D2=1'b1; 
    #20;  //wait for 20 time units (20ns in this case)
  end
  
endmodule
