// This program was cloned from: https://github.com/conboy/elec374-cpu
// License: MIT License

module bus_mux_32_to_1 (
    // 32 bit output from a selected register
    output reg [31:0] bus_mux_out,

    // 5 bit input from the encoder_32_to_5 to select the register to put on the bus
    input [4:0] select_signal,
    
    // up to 32 wire inputs because 5 bit select signal (24 for now)
    input [31:0] bus_mux_in_r0,
    input [31:0] bus_mux_in_r1,
    input [31:0] bus_mux_in_r2,
    input [31:0] bus_mux_in_r3,
    input [31:0] bus_mux_in_r4,
    input [31:0] bus_mux_in_r5,
    input [31:0] bus_mux_in_r6,
    input [31:0] bus_mux_in_r7,
    input [31:0] bus_mux_in_r8,
    input [31:0] bus_mux_in_r9,
    input [31:0] bus_mux_in_r10,
    input [31:0] bus_mux_in_r11,
    input [31:0] bus_mux_in_r12,
    input [31:0] bus_mux_in_r13,
    input [31:0] bus_mux_in_r14,
    input [31:0] bus_mux_in_r15,
    input [31:0] bus_mux_in_hi,
    input [31:0] bus_mux_in_lo,
    input [31:0] bus_mux_in_zhi,
    input [31:0] bus_mux_in_zlo,
    input [31:0] bus_mux_in_pc,
    input [31:0] bus_mux_in_mdr,
    input [31:0] bus_mux_in_inport,
    input [31:0] bus_mux_in_c_sign_extended
);

always @ (*) begin
	case (select_signal)
        // Select the register to put on the bus based on the 5 bit input from the 32 to 5 encoder
        5'h01   :   bus_mux_out <= bus_mux_in_r0;
        5'h02   :   bus_mux_out <= bus_mux_in_r1;
        5'h03   :   bus_mux_out <= bus_mux_in_r2;
        5'h04   :   bus_mux_out <= bus_mux_in_r3;
        5'h05   :   bus_mux_out <= bus_mux_in_r4;
        5'h06   :   bus_mux_out <= bus_mux_in_r5;
        5'h07   :   bus_mux_out <= bus_mux_in_r6;
        5'h08   :   bus_mux_out <= bus_mux_in_r7;
        5'h09   :   bus_mux_out <= bus_mux_in_r8;
        5'h0A   :   bus_mux_out <= bus_mux_in_r9;
        5'h0B   :   bus_mux_out <= bus_mux_in_r10;
        5'h0C   :   bus_mux_out <= bus_mux_in_r11;
        5'h0D   :   bus_mux_out <= bus_mux_in_r12;
        5'h0E   :   bus_mux_out <= bus_mux_in_r13;
        5'h0F   :   bus_mux_out <= bus_mux_in_r14;
        5'h10   :   bus_mux_out <= bus_mux_in_r15;
        5'h11   :   bus_mux_out <= bus_mux_in_hi;
        5'h12   :   bus_mux_out <= bus_mux_in_lo;
        5'h13   :   bus_mux_out <= bus_mux_in_zhi;
        5'h14   :   bus_mux_out <= bus_mux_in_zlo;
        5'h15   :   bus_mux_out <= bus_mux_in_pc;
        5'h16   :   bus_mux_out <= bus_mux_in_mdr;
        5'h17   :   bus_mux_out <= bus_mux_in_inport;
        5'h18   :   bus_mux_out <= bus_mux_in_c_sign_extended;
        default :   bus_mux_out <= 32'hFFFFFFFF;   // if no valid select_signal, default to 0
    endcase
end

endmodule