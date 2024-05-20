// This program was cloned from: https://github.com/namberino/nam80
// License: BSD 2-Clause "Simplified" License

module alu(
    input clk,
    input rst,
    input ctrl_sig,
    input flags_write_en,
    input acc_write_en,
    input act_store,
    input act_restore,
    input tmp_write_en,
    input[4:0] opcode,
    input[7:0] data_in,
    output[7:0] flags_out,
    output[7:0] out
);

    // operations opcode
    localparam ADD = 5'b00000; // add
	localparam ADC = 5'b00001; // add carry
	localparam SUB = 5'b00010; // sub
	localparam SBB = 5'b00011; // sub borrow
	localparam ANA = 5'b00100; // and
	localparam XRA = 5'b00101; // xor
	localparam ORA = 5'b00110; // or
	localparam CMP = 5'b00111; // compare
	localparam RLC = 5'b01000; // rotate left carry
	localparam RRC = 5'b01001; // rotate right carry
	localparam RAL = 5'b01010; // rotate left
	localparam RAR = 5'b01011; // rotate right
	localparam DAA = 5'b01100; // adjust result in bcd
	localparam CMA = 5'b01101; // complement
	localparam STC = 5'b01110; // set carry
	localparam CMC = 5'b01111; // complement carry
	localparam INR = 5'b10000; // increment
	localparam DCR = 5'b10001; // decrement

    // flags
    reg[7:0] flags;
    localparam Z = 0;
    localparam C = 1;
    localparam P = 2;
    localparam S = 3;

    wire flag_z;
    wire flag_c;
    wire flag_p;
    wire flag_s;

    reg carry;

    // registers
    reg[7:0] acc;
    reg[7:0] act;
    reg[7:0] tmp;
    
    // flag handling
    assign flag_z = (acc[7:0] == 8'b0);
    assign flag_c = (carry == 1'b1);
    assign flag_p = ~^acc[7:0];
    assign flag_s = acc[7];

    always @ (negedge clk, posedge rst)
    begin
        if (rst)
            flags <= 8'b0;
        else if (flags_write_en)
            flags <= data_in;
        else
        begin
            if (ctrl_sig) // set flags based on operation
            begin
                case (opcode)
                    ADD, ADC, SUB, SBB, ANA, XRA, ORA:
                    begin
                        flags[Z] <= flag_z;
                        flags[C] <= flag_c;
                        flags[P] <= flag_p;
                        flags[S] <= flag_s;
                    end

                    CMP:
                    begin
                        flags[Z] <= (act == 8'b0);
                    end

                    RLC, RRC, RAL, RAR, STC, CMC:
                    begin
                        flags[C] <= flag_c;
                    end

                    INR, DCR:
                    begin
                        flags[Z] <= flag_z;
                        flags[P] <= flag_p;
                        flags[S] <= flag_s;
                    end
                endcase
            end
        end
    end

    // alu operations
    always @ (posedge clk, posedge rst)
    begin
        if (rst)
        begin
            acc <= 8'b0;
            act <= 8'b0;
            tmp <= 8'b0;
            carry <= 1'b0;
        end else
        begin
            if (act_store)
                act <= acc;
            if (tmp_write_en)
                tmp <= data_in;

            if (acc_write_en)
                acc <= data_in;
            else if (act_restore)
                acc <= act;
            
            if (ctrl_sig)
            begin
                case (opcode)
                    ADD: {carry, acc} <= acc + tmp;
                    ADC: {carry, acc} <= acc + tmp + flags[C];
                    SUB: {carry, acc} <= acc - tmp;
                    SBB: {carry, acc} <= acc - tmp - flags[C];
                    ANA: {carry, acc} <= acc & tmp;
                    XRA: {carry, acc} <= acc ^ tmp;
                    ORA: {carry, acc} <= acc | tmp;
                    CMP: act <= acc - tmp;
                    RLC: 
                    begin
                        carry <= acc[7];
                        acc <= acc << 1;
                    end
                    RRC:
                    begin
                        carry <= acc[0];
                        acc <= acc >> 1;
                    end
                    RAL:
                    begin
                        carry <= acc[7];
                        acc <= acc << 1 | {7'b0, flags[C]};
                    end
                    RAR:
                    begin
                        carry <= acc[0];
                        acc <= acc >> 1 | {flags[C], 7'b0};
                    end
                    CMA: acc = ~acc;
                    STC: carry <= 1'b1;
                    CMC: carry <= ~flags[C];
                    INR: acc <= acc + 1;
                    DCR: acc <= acc - 1;
                endcase
            end
        end
    end

    assign flags_out = flags;
    assign out = acc;

endmodule
