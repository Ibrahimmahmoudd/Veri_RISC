module alu (
    input [7:0] A,
    input [7:0] B,
    input [2:0] opcode,
    output [7:0] alu_out
);
    reg [7:0] result;
    always @(*) begin
        case (opcode)
            3'b000: result = A + B;
            3'b001: result = A - B;
            3'b010: result = A & B; 
            3'b011: result = A | B; 
            default: result = 0; 
        endcase
    end
    assign alu_out = result;
endmodule