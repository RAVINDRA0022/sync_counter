`timescale 1ns / 1ps


module tff(input clk, input rst, input t, output reg q);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0; 
        else if (t)
            q <= ~q;   
    end
endmodule

module sync_counter(input clk, input rst, output [3:0] q);
    wire w1,w2,w3,w4;
    
    assign w1 = 1'b1; 
    assign w2 = q[0]; 
    assign w3 = q[0] & q[1]; 
    assign w4 = q[0] & q[1] & q[2]; 
    
   tff tff0 (clk, rst, w1, q[0]);
   tff tff1 (clk, rst, w2, q[1]);
   tff tff2 (clk, rst, w3, q[2]);
   tff tff3 (clk, rst, w4, q[3]);
endmodule
