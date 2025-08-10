module counter_clk (
    input clk,
    input rst,
    output reg [1:0] phase
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            phase <= 0;
        end else begin
            phase <= phase + 1;
        end
    end
endmodule