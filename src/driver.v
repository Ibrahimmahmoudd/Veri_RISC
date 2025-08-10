module driver (
    input data_e,
    input [7:0] alu_out,
    output [7:0] data_bus
);
    assign data_bus = (data_e) ? alu_out : 8'bz;
endmodule