`timescale 1ns/1ps

module alu_tb;

reg [7:0] A, B;
reg [3:0] opcode;
wire [7:0] result;
wire zero, carry, overflow;


alu uut (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .zero(zero),
    .carry(carry),
    .overflow(overflow)
);

initial begin
    
    A = 8'd 255; B = 8'd1;

    opcode = 4'b0000; #10;

    opcode = 4'b0001; #10;

    opcode = 4'b0010; #10;

    opcode = 4'b0011; #10;

    opcode = 4'b0100; #10;

    opcode = 4'b0101; #10;

    opcode = 4'b0110; #10;

    opcode = 4'b0111; #10;

    A = 0; B = 0;
   
    opcode = 4'b0000; #10;

    $stop;
end

endmodule

