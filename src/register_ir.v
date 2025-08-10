module register_ir (
    input clk,
    input rst,
    input ld_ir,
    input [7:0] data_in,
    output reg [7:0] ir_addr
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ir_addr <= 0;
        end else if (ld_ir) begin
            ir_addr <= data_in;
        end
    end
endmodule