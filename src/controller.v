module controller (
    input [1:0] phase,
    input [7:0] ir_out,
    output reg rd,
    output reg wr,
    output reg ld_ir,
    output reg ld_ac,
    output reg ld_pc,
    output reg inc_pc,
    output reg halt,
    output reg data_e,
    output reg sel,
    output reg [2:0] opcode
);
    always @(*) begin
        case (phase)
            2'b00: begin 
                rd = 1;
                ld_ir = 1;
                wr = 0;
                ld_ac = 0;
                ld_pc = 0;
                inc_pc = 0;
                halt = 0;
                data_e = 0;
                sel = 0; 
                opcode = 0;
            end
            2'b01: begin 
                rd = 0;
                ld_ir = 0;
                wr = 0;
                ld_ac = 0;
                ld_pc = 0;
                inc_pc = 0;
                halt = 0;
                data_e = 0;
                sel = 0;
                opcode = ir_out[2:0]; 
            end
            default: begin 
                rd = 0;
                wr = 0;
                ld_ir = 0;
                ld_ac = 0;
                ld_pc = 0;
                inc_pc = 0;
                halt = 0;
                data_e = 0;
                sel = 0;
                opcode = 0;
            end
        endcase
    end
endmodule