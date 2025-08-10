`timescale 1ns / 1ps

module simple_processor (
    input clk,
    input rst
);

    // Internal wires
    wire [7:0] data_bus;
    wire [7:0] addr;
    wire [1:0] phase;
    wire rd, wr, ld_ir, ld_ac, ld_pc, inc_pc, halt, data_e, sel;
    wire [2:0] opcode;
    wire [7:0] ac_out;
    wire [7:0] alu_out;
    wire [7:0] pc_addr;
    wire [7:0] ir_out;

    // Instantiate components
    counter_clk u_counter_clk (
        .clk(clk),
        .rst(rst),
        .phase(phase)
    );

    controller u_controller (
        .phase(phase),
        .ir_out(ir_out),
        .rd(rd),
        .wr(wr),
        .ld_ir(ld_ir),
        .ld_ac(ld_ac),
        .ld_pc(ld_pc),
        .inc_pc(inc_pc),
        .halt(halt),
        .data_e(data_e),
        .sel(sel),
        .opcode(opcode)
    );

    address_mux u_address_mux (
        .sel(sel),
        .ir_addr(ir_out),
        .pc_addr(pc_addr),
        .addr(addr)
    );

    memory u_memory (
        .clk(clk),
        .rd(rd),
        .wr(wr),
        .addr(addr),
        .data_bus(data_bus)
    );

    register_ir u_register_ir (
        .clk(clk),
        .rst(rst),
        .ld_ir(ld_ir),
        .data_in(data_bus),
        .ir_addr(ir_out)
    );

    register_ac u_register_ac (
        .clk(clk),
        .rst(rst),
        .ld_ac(ld_ac),
        .data_in(data_bus),
        .ac_out(ac_out)
    );

    alu u_alu (
        .A(ac_out),
        .B(data_bus),
        .opcode(opcode),
        .alu_out(alu_out)
    );

    driver u_driver (
        .data_e(data_e),
        .alu_out(alu_out),
        .data_bus(data_bus)
    );

    counter_pc u_counter_pc (
        .clk(clk),
        .rst(rst),
        .ld_pc(ld_pc),
        .inc_pc(inc_pc),
        .pc_in(data_bus),
        .pc_addr(pc_addr)
    );

endmodule