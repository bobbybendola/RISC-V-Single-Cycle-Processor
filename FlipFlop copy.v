`timescale 1ns / 1ps

module FlipFlop(clk, reset,d, q);

//Defining input and output signals 
    input wire clk;
    input wire reset;
    input wire [7:0]d;
    output reg [7:0] q;
//Defining Flip-Flop behaviour

    always @(posedge clk) begin
        if(!reset)begin
        q<=d;
        end
        else begin
        q <=8'b0;
        end
     end
endmodule
