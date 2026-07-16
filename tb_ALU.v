`timescale 1ns / 1ps

module tb_alu_32();
//Define I/O Ports
     wire [31:0] ALU_Out ; 
     wire Carry_Out;
     wire Zero;
     wire Overflow;
     
     reg [31:0] tb_din_a;
     reg [31:0] tb_din_b;
     reg [3:0] tb_alu_sel;
    
//Port Mapping
alu_32 instant
(
    .ALU_Out(ALU_Out),
    .Carry_Out(Carry_Out),
    .Zero(Zero),
    .Overflow(Overflow),
    
    .A_in(tb_din_a),
    .B_in(tb_din_b),
    .ALU_Sel(tb_alu_sel)
 );   
 
 //Test Samples
 initial
    begin 
    
    //TEST SAMPLE 1
    tb_din_a=32'h086a0c31;
    tb_din_b=32'hd785f148;
    tb_alu_sel=4'b0000;
    #20;
    
    //TEST SAMPLE 2
    tb_din_a=32'h086a0c31;
    tb_din_b=32'h10073fd4;
    tb_alu_sel=4'b0001;
    #20;
    
    //TEST SAMPLE 3
    tb_din_a=32'ha86a0c31;
    tb_din_b=32'h90073fd4;
    tb_alu_sel=4'b0010;
    #20;
    
    //TEST SAMPLE 4
    tb_din_a=32'ha86a0c31;
    tb_din_b=32'h90073fd4;
    tb_alu_sel=4'b0110;
    #20;
    
    //TEST SAMPLE 5
    tb_din_a=32'ha86a0c31;
    tb_din_b=32'h90073fd4;
    tb_alu_sel=4'b0111;
    #20;
    
    //TEST SAMPLE 6
    tb_din_a=32'ha86a0c31;
    tb_din_b=32'h90073fd4;
    tb_alu_sel=4'b1100;
    #20;
    
    //TEST SAMPLE 7
    tb_din_a=32'ha86a0c31;
    tb_din_b=32'ha86a0c31;
    tb_alu_sel=4'b1111;
    #20;
    
    //TEST SAMPLE 8 
    tb_din_a=32'ha86a0c31;
    tb_din_b=32'h10073fd4;
    tb_alu_sel=4'b1111;
    #20;
    
    
    //OWN TEST SAMPLE 9, addition of 0s
    tb_din_a=32'h0;
    tb_din_b=32'h0;
    tb_alu_sel=4'b0010;
    #20;
    
    
    //OWN TEST SAMPLE 10, subtraction of 0s
    tb_din_a=32'h0;
    tb_din_b=32'h0;
    tb_alu_sel=4'b0110;
    #20;
    
    //OWN TEST SAMPLE 10, subtraction of 0s
    tb_din_a=32'h0;
    tb_din_b=32'h0;
    tb_alu_sel=4'b0110;
    #20;
    
    //OWN TEST SAMPLE 11, set less than of 0s
    tb_din_a=32'h0;
    tb_din_b=32'h0;
    tb_alu_sel=4'b0111;
    #20;
    
    
    //OWN TEST SAMPLE 12, set less than is TRUE
    tb_din_a=32'h1;
    tb_din_b=32'ha;
    tb_alu_sel=4'b0111;
    #20;
    
    //OWN TEST SAMPLE 13, trying out Default case
    tb_din_a=32'h1;
    tb_din_b=32'ha;
    tb_alu_sel=4'b000x;
    #20;
    
    /*
    
    // Test Case 13: Add - Positive Overflow (Max Pos + 1)
    // Result should be 80000000, Overflow=1, Carry_Out=0, Zero=0
    tb_din_a = 32'h7FFFFFFF; tb_din_b = 32'h00000001; tb_alu_sel = 4'b0010;
    #20;
    
    // Test Case 14: Add - Manual Note 5 Case (Carry Out Validation)
    // This specifically tests if Carry_Out is 1 as required 
    tb_din_a = 32'hB0000000; tb_din_b = 32'h60000000; tb_alu_sel = 4'b0010;
    #20;
    
    // Test Case 11: SLT (Positive vs Negative)
    // 5 is NOT less than -5. Expected Result = 0;
    tb_din_a = 32'h00000005; tb_din_b = 32'hFFFFFFFB; tb_alu_sel = 4'b0111;
    #20;
    
    // Test Case 12: SLT (Negative vs Positive)
    // -5 IS less than 5. Expected Result = 1
    tb_din_a = 32'hFFFFFFFB; tb_din_b = 32'h00000005; tb_alu_sel = 4'b0111;
    #20;
    
    // Test Case 13: Subtraction producing Zero
    // Result = 0, Zero Flag = 1, Overflow = 0, CarryOut=0
    tb_din_a = 32'h80000000; tb_din_b = 32'h80000000; tb_alu_sel = 4'b0110;
    #20;
    // Test Case 14: Negative Overflow in Subtraction
    //Result: ALU_out=32'h7FFFFFFF, CarryOut=0, Overflow=1
    // Subtracting a positive from a large negative.
    tb_din_a = 32'h80000000; tb_din_b = 32'h00000001; tb_alu_sel = 4'b0110;
    #20;
    
    // Test Case 15: NOR (All Zeros)
    // NOR of 0 and 0 should be all 1s (FFFFFFFF) 
    tb_din_a = 32'h00000000; tb_din_b = 32'h00000000; tb_alu_sel = 4'b1100;
    #20;

    // Test Case 16: Equal Comparison (High Values)
    // If a == b, Result = 1 
    tb_din_a = 32'hFFFFFFFF; tb_din_b = 32'hFFFFFFFF; tb_alu_sel = 4'b1111;
    #20;
    */
    
end //end of test samples
endmodule
