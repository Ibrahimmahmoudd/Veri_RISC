module memory (
    input clk,
    input rd,
    input wr,
    input [7:0] addr,
    inout [7:0] data_bus
);
    reg [7:0] mem [0:255]; 
    assign data_bus = (rd) ? mem[addr] : 8'bz;
    always @(posedge clk) begin
        if (wr) begin
            mem[addr] <= data_bus;
        end
    end
endmodule