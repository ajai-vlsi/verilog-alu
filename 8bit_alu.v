module alu (
    input [7:0] A,
    input [7:0] B,
    input [3:0] opcode,
    output reg [7:0] result,
    output reg zero,
    output reg carry,
    output reg overflow
);

always @(*) 
  begin
    result = 8'b0;
    carry = 0;
    overflow = 0;

    case(opcode)

        4'b0000: begin
            {carry, result} = A + B;
            overflow = (A[7] == B[7]) && (result[7] != A[7]);
        end

        4'b0001: begin
            {carry, result} = A - B;
            overflow = (A[7] != B[7]) && (result[7] != A[7]);
        end

        4'b0010: result = A & B; 

        4'b0011: result = A | B; 

        4'b0100: result = A ^ B; 
      
        4'b0101: result = ~A;    

        4'b0110: result = A << 1; 

        4'b0111: result = A >> 1; 

        default: result = 8'b0;

    endcase

   
    if (result == 8'b0)
        zero = 1;
    else
        zero = 0;

end

endmodule



