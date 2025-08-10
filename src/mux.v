module address_mux (
    input sel,
    input [7:0] ir_addr,
    input [7:0] pc_addr,
    output [7:0] addr
);
    assign addr = (sel) ? ir_addr : pc_addr;
endmodule