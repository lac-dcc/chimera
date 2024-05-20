// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module datapath (
    input reset,
    input stop,
    input clk,
    input [31:0] inport_in,
    output [31:0] outport_data,
    output [7:0] display_data
);

wire [31:0] bus;
wire [31:0] mdr_connection;
wire [63:0] alu_out;

// From phase 2
wire [4:0] op_code;
wire [15:0] r0_15in; // A 16-bit wide signal, where each bit represents an enable signal for a register.
wire [15:0] r0_15out; // A 16-bit wide signal, where each bit represents an out signal for a register.
wire [31:0] c_sign_extended_connection; // wire to connect select and encode logic to c_sign_extended
wire [31:0] m_data_in; // wire to connect ram to mdr_mux => mdr
wire con_out; // output of conff

// Register enable signals
wire r0_enable;
wire r1_enable;
wire r2_enable;
wire r3_enable;
wire r4_enable;
wire r5_enable;
wire r6_enable;
wire r7_enable;
wire r8_enable;
wire r9_enable;
wire r10_enable;
wire r11_enable;
wire r12_enable;
wire r13_enable;
wire r14_enable;
wire r15_enable;
wire y_enable;
wire hi_enable;
wire lo_enable;
wire z_enable;
wire pc_enable;
wire mar_enable;
wire mdr_enable;
wire ir_enable;
wire c_sign_extended_enable;

// Register output flags
wire r0_out = 0;
wire r1_out = 0;
wire r2_out = 0;
wire r3_out = 0;
wire r4_out = 0;
wire r5_out = 0;
wire r6_out = 0;
wire r7_out = 0;
wire r8_out = 0;
wire r9_out = 0;
wire r10_out = 0;
wire r11_out = 0;
wire r12_out = 0;
wire r13_out = 0;
wire r14_out = 0;
wire r15_out = 0;
// wire pc_out = 0;
wire y_out = 0;
// wire hi_out = 0;
// wire lo_out = 0;
// wire zhi_out = 0;
// wire zlo_out = 0;
wire mar_out = 0;
// wire mdr_out = 0;
// wire inport_out = 0;
// wire c_sign_extended_out = 0;

// Register output data wires (connect to the bus)
wire [31:0] r0_data;
wire [31:0] r1_data;
wire [31:0] r2_data;
wire [31:0] r3_data;
wire [31:0] r4_data;
wire [31:0] r5_data;
wire [31:0] r6_data;
wire [31:0] r7_data;
wire [31:0] r8_data;
wire [31:0] r9_data;
wire [31:0] r10_data;
wire [31:0] r11_data;
wire [31:0] r12_data;
wire [31:0] r13_data;
wire [31:0] r14_data;
wire [31:0] r15_data;
wire [31:0] y_data;
wire [31:0] pc_data;
wire [31:0] hi_data;
wire [31:0] lo_data;
wire [31:0] zhi_data;
wire [31:0] mdr_data;
wire [31:0] mar_data;
wire [31:0] zlo_data;
wire [31:0] inport_data;
wire [31:0] c_sign_extended_data;
wire [31:0] ir_data;



// Instantiate register modules
r0_reg r0(clk, clr, r0_15in[0], ba_out, bus, r0_data);
reg_32_bit r1(clk, clr, r0_15in[1], bus, r1_data);
reg_32_bit r2(clk, clr, r0_15in[2], bus, r2_data);
reg_32_bit r3(clk, clr, r0_15in[3], bus, r3_data);
reg_32_bit r4(clk, clr, r0_15in[4], bus, r4_data);
reg_32_bit r5(clk, clr, r0_15in[5], bus, r5_data);
reg_32_bit r6(clk, clr, r0_15in[6], bus, r6_data);
reg_32_bit r7(clk, clr, r0_15in[7], bus, r7_data);
reg_32_bit r8(clk, clr, r0_15in[8], bus, r8_data);
reg_32_bit r9(clk, clr, r0_15in[9], bus, r9_data);
reg_32_bit r10(clk, clr, r0_15in[10], bus, r10_data);
reg_32_bit r11(clk, clr, r0_15in[11], bus, r11_data);
reg_32_bit r12(clk, clr, r0_15in[12], bus, r12_data);
reg_32_bit r13(clk, clr, r0_15in[13], bus, r13_data);
reg_32_bit r14(clk, clr, r0_15in[14], bus, r14_data);
reg_32_bit r15(clk, clr, r15_enable, bus, r15_data);    // FIXME: r15_enable is temporary for phase 2

reg_32_bit y(clk, y_clr, y_enable, bus, y_data);
reg_32_bit hi(clk, clr, hi_enable, bus, hi_data);
reg_32_bit lo(clk, clr, lo_enable, bus, lo_data);
reg_32_bit zlo(clk, clr, z_enable, alu_out[31:0], zlo_data);
reg_32_bit zhi(clk, clr, z_enable, alu_out[63:32], zhi_data);
reg_32_bit ir(clk, ir_clr, ir_enable, bus, ir_data);
reg_32_bit mar(clk, clr, mar_enable, bus, mar_data);
reg_32_bit mdr(clk, clr, mdr_enable, mdr_connection, mdr_data);
c_sign_extended_reg c_sign_extended(clk, clr, c_sign_extended_connection, c_sign_extended_data);
pc_reg pc(clk, pc_enable, pc_increment, bus, pc_data);

// Instantiate Control Unit
control_unit control_unit(
    .clk(clk),
    .reset(reset),
    .stop(stop),
    .con_ff(con_out),
    .ir(ir_data),

    .inport_out(inport_out),
    .read(read),
    .ram_write(ram_write),

    .hi_enable(hi_enable),
    .lo_enable(lo_enable),
    .con_enable(con_enable),
    .pc_enable(pc_enable),
    .ir_enable(ir_enable),
    .y_enable(y_enable),
    .z_enable(z_enable),
    .mar_enable(mar_enable),
    .mdr_enable(mdr_enable),
    .outport_enable(outport_enable),
    .c_sign_extended_out(c_sign_extended_out),
    .ba_out(ba_out),

    .gra(gra),
    .grb(grb),
    .grc(grc),
    .r_in(r_in),
    .r_out(r_out),
    .hi_out(hi_out),
    .lo_out(lo_out),
    .zhi_out(zhi_out),
    .zlo_out(zlo_out),
    .mdr_out(mdr_out),
    .pc_out(pc_out),

    .pc_increment(pc_increment),
    .y_clr(y_clr),
    .ir_clr(ir_clr),
    .clr(clr),
    .r15_enable(r15_enable)
);

// Instantiate RAM, SEE IF THESE ARE THE RIGHT CONNECTIONS
ram_512x32 ram_memory(
    .clk(clk),
    .addr(mar_data),
    .data_in(mdr_data),
    .write_enable(ram_write),
    .data_out(m_data_in)
);


// Instantiate I/O ports
inport inport(clk, clr, inport_enable, inport_in, inport_data);
outport outport(clk, clr, outport_enable, bus, outport_data);


// Instantiate MDR Mux
mdr_mux_2_to_1 mdr_mux(
    .out(mdr_connection),
    .read(read),
    .from_bus(bus),
    .from_mem_chip(m_data_in)
);

// TODO: Instantiate CON FF Logic
conff conff(
    .bus(bus),
    .c2(ir_data[22:19]),
    .con_enable(con_enable),
    .condition(con_out)
);

// Instantiate select and encode logic
select_encode_logic select_encode(
    .ir(ir_data),
    .gra(gra),
    .grb(grb),
    .grc(grc),
    .r_in(r_in),
    .r_out(r_out),
    .ba_out(ba_out),
    .r0_15in(r0_15in),
    .r0_15out(r0_15out),
    .op_code(op_code),
    .c_sign_extended(c_sign_extended_connection)
);

// Instantiate Select Signal Encoder and select signal 
wire [31:0] select;
wire [4:0] select_encoded;

assign select = {
    8'b0,
    c_sign_extended_out, 
    inport_out, 
    mdr_out, 
    pc_out, 
    zlo_out, 
    zhi_out, 
    lo_out, 
    hi_out, 
    r0_15out[15], 
    r0_15out[14],
    r0_15out[13],
    r0_15out[12],
    r0_15out[11],
    r0_15out[10],
    r0_15out[9],
    r0_15out[8],
    r0_15out[7],
    r0_15out[6],
    r0_15out[5],
    r0_15out[4],
    r0_15out[3],
    r0_15out[2],
    r0_15out[1],
    r0_15out[0]
};

encoder_32_to_5 select_encoder(
    .encoder_in(select),
    .encoder_out(select_encoded)
);

// Instantiate ALU
alu alu(
    .c(alu_out),
    .op_code(op_code),
    .a(y_data),
    .b(bus),
    .clk(clk)
);

// Instantiate Bus Mux
bus_mux_32_to_1 bus_mux(
    .bus_mux_out(bus),
    .select_signal(select_encoded),
    .bus_mux_in_r0(r0_data),
    .bus_mux_in_r1(r1_data),
    .bus_mux_in_r2(r2_data),
    .bus_mux_in_r3(r3_data),
    .bus_mux_in_r4(r4_data),
    .bus_mux_in_r5(r5_data),
    .bus_mux_in_r6(r6_data),
    .bus_mux_in_r7(r7_data),
    .bus_mux_in_r8(r8_data),
    .bus_mux_in_r9(r9_data),
    .bus_mux_in_r10(r10_data),
    .bus_mux_in_r11(r11_data),
    .bus_mux_in_r12(r12_data),
    .bus_mux_in_r13(r13_data),
    .bus_mux_in_r14(r14_data),
    .bus_mux_in_r15(r15_data),
    .bus_mux_in_hi(hi_data),
    .bus_mux_in_lo(lo_data),
    .bus_mux_in_zhi(zhi_data),
    .bus_mux_in_zlo(zlo_data),
    .bus_mux_in_pc(pc_data),
    .bus_mux_in_mdr(mdr_data),
    .bus_mux_in_inport(inport_data),
    .bus_mux_in_c_sign_extended(c_sign_extended_data)
);


Seven_Seg_Display_Out display(
    .outputt(display_data[7:0]),
    .clk(clk),
    .data(inport_in[3:0])
);

endmodule
