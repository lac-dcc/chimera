// This program was cloned from: https://github.com/niklasekstrom/clockport_pi_interface
// License: GNU General Public License v3.0

/*
 * Amiga clock port to Raspberry Pi interface.
 * Fits in XC9572XL-10-VQ64.
 *
 * Written by Niklas Ekström in June 2022.
 */
module cp_pi_if(
    input CLK, // 100(?) MHz.

    input RTC_CS_n,
    input IORD_n,
    input IOWR_n,
    input [1:0] CP_A,

    input PI_REQ,
    input PI_WR,
    input [1:0] PI_A,
    output reg PI_ACK,

    inout [7:0] D,

    output reg LE_OUT = 1'b0,
    output reg OE_IN_n = 1'b1,
    output OE_OUT_n,

    inout [7:0] PI_D,

    output INT6_n,
    output reg PI_IRQ,

    output [15:0] RAM_A,
    output reg RAM_OE_n = 1'b1,
    output reg RAM_WE_n = 1'b1
    );

localparam [1:0] REG_SRAM = 2'd0;
localparam [1:0] REG_IRQ = 2'd1;
localparam [1:0] REG_A_LO = 2'd2;
localparam [1:0] REG_A_HI = 2'd3;

localparam [2:0] STATE_IDLE = 3'd0;
localparam [2:0] STATE_SWAP_ADDRESSES = 3'd1;
localparam [2:0] STATE_ADDRESS_STABLE = 3'd2;
localparam [2:0] STATE_LATCH_OPEN = 3'd3;
localparam [2:0] STATE_LATCH_CLOSED = 3'd4;

reg [2:0] state;

wire cp_rd = !RTC_CS_n && !IORD_n;
wire cp_wr = !RTC_CS_n && !IOWR_n;
wire cp_req = cp_rd || cp_wr;

reg cp_req_sync;
reg cp_ack;

reg pi_req_sync;

always @(posedge CLK) begin
    cp_req_sync <= cp_req;
    pi_req_sync <= PI_REQ;
end

reg cp_irq;
assign INT6_n = cp_irq ? 1'b0 : 1'bz;

assign OE_OUT_n = !cp_rd;

reg [1:0] access_reg;
reg write_access;
reg cp_access;

reg drive_data_from_pi;
wire drive_irq = state != STATE_IDLE && access_reg == REG_IRQ && !write_access;
assign D = drive_data_from_pi ? PI_D : (drive_irq ? {7'd0, cp_access ? cp_irq : PI_IRQ} : 8'bz);

reg [7:0] pi_data;
assign PI_D = PI_REQ && !PI_WR ? pi_data : 8'bz;

reg [15:0] front_address;
reg [15:0] back_address;
assign RAM_A = front_address;

always @(posedge CLK) begin
    case (state)
        STATE_IDLE: begin
            if (cp_req_sync && !cp_ack) begin
                state <= !cp_access ? STATE_SWAP_ADDRESSES : STATE_ADDRESS_STABLE;

                access_reg <= CP_A;
                write_access <= !IOWR_n;
                cp_access <= 1'b1;

                if (!IOWR_n) begin
                    OE_IN_n <= 1'b0;
                end else begin
                    if (CP_A == REG_SRAM)
                        RAM_OE_n <= 1'b0;
                end
            end else if (pi_req_sync && !PI_ACK) begin
                state <= cp_access ? STATE_SWAP_ADDRESSES : STATE_ADDRESS_STABLE;

                access_reg <= PI_A;
                write_access <= PI_WR;
                cp_access <= 1'b0;

                if (PI_WR) begin
                    drive_data_from_pi <= 1'b1;
                end else begin
                    if (PI_A == REG_SRAM)
                        RAM_OE_n <= 1'b0;
                end
            end
        end

        STATE_SWAP_ADDRESSES: begin
            front_address <= back_address;
            back_address <= front_address;
            state <= STATE_ADDRESS_STABLE;
        end

        STATE_ADDRESS_STABLE: begin
            if (write_access) begin
                if (access_reg == REG_SRAM)
                    RAM_WE_n <= 1'b0;
            end else begin
                if (cp_access)
                    LE_OUT <= 1'b1;
            end

            state <= STATE_LATCH_OPEN;
        end

        STATE_LATCH_OPEN: begin
            LE_OUT <= 1'b0;
            RAM_WE_n <= 1'b1;

            if (write_access) begin
                case (access_reg)
                    REG_IRQ: begin
                        if (D[7])
                            {PI_IRQ, cp_irq} <= {PI_IRQ, cp_irq} | D[1:0];
                        else
                            {PI_IRQ, cp_irq} <= {PI_IRQ, cp_irq} & ~D[1:0];
                    end
                    REG_A_LO: front_address[7:0] <= D;
                    REG_A_HI: front_address[15:8] <= D;
                endcase
            end else begin
                if (!cp_access)
                    pi_data <= D;
            end

            state <= STATE_LATCH_CLOSED;
        end

        STATE_LATCH_CLOSED: begin
            OE_IN_n <= 1'b1;
            RAM_OE_n <= 1'b1;
            drive_data_from_pi <= 1'b0;

            if (access_reg == REG_SRAM)
                front_address <= front_address + 16'd1;

            if (cp_access)
                cp_ack <= 1'b1;
            else
                PI_ACK <= 1'b1;

            state <= STATE_IDLE;
        end
    endcase

    if (!cp_req_sync)
        cp_ack <= 1'b0;

    if (!pi_req_sync)
        PI_ACK <= 1'b0;
end

endmodule
