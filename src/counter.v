module counter_pc (
    input clk,
    input rst,
    input ld_pc,
    input inc_pc,
    input [7:0] pc_in,
    output reg [7:0] pc_addr
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc_addr <= 0;
        end else if (ld_pc) begin
            pc_addr <= pc_in;
        end else if (inc_pc) begin
            pc_addr <= pc_addr + 1;
        end
    end
endmodule