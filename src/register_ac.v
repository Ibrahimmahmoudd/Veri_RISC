module register_ac (
    input clk,
    input rst,
    input ld_ac,
    input [7:0] data_in,
    output reg [7:0] ac_out
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ac_out <= 0;
        end else if (ld_ac) begin
            ac_out <= data_in;
        end
    end
endmodule