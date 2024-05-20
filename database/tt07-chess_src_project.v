// This program was cloned from: https://github.com/Ravenslofty/tt07-chess
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Hannah Ravensloft
 * SPDX-License-Identifier: Apache-2.0
 */

/* verilator lint_off DECLFILENAME */

`default_nettype none

`define PAWN   3'd0
`define KNIGHT 3'd1
`define BISHOP 3'd2
`define ROOK   3'd3
`define QUEEN  3'd4
`define KING   3'd5
`define EMPTY  3'd7

`define US   1'b0
`define THEM 1'b1

`define VICTIM    1'b0
`define AGGRESSOR 1'b1


// Propagate incoming attacks or generate attacks from this square.
module xmit_half (
    input  wire [3:0] piece_reg,
    input  wire       op,
    input  wire       xmit_addr,
    input  wire [2:0] rank,
    input  wire       south_in,
    input  wire       west_in,
    input  wire       southeast_in,
    input  wire       southwest_in,
    output wire       north_out,
    output wire       east_out,
    output wire       northeast_out,
    output wire       northwest_out,
    output wire       knight,
    output wire       king,
    output wire       pawn,
    output wire       pawn_2sq
);

wire [2:0] piece = piece_reg[2:0];
wire color = piece_reg[3];

wire manhattan = (op == `AGGRESSOR && xmit_addr) || (op == `VICTIM && color == `US && (piece == `ROOK || piece == `QUEEN));
wire diagonal = (op == `AGGRESSOR && xmit_addr) || (op == `VICTIM && color == `US && (piece == `BISHOP || piece == `QUEEN));
wire empty = (op == `VICTIM || ~xmit_addr) && piece == `EMPTY;

assign knight = (op == `AGGRESSOR && xmit_addr) || (op == `VICTIM && color == `US && piece == `KNIGHT);
assign king = (op == `AGGRESSOR && xmit_addr) || (op == `VICTIM && color == `US && piece == `KING);
assign pawn = (op == `AGGRESSOR && xmit_addr) || (op == `VICTIM && color == `US && piece == `PAWN);
assign pawn_2sq = pawn && (rank == 1);

// If there is an empty piece, attacks propagate through, otherwise it depends on the piece.
assign north_out = empty ? south_in : manhattan;
assign east_out  = empty ? west_in  : manhattan;

assign northeast_out = empty ? southwest_in : diagonal;
assign northwest_out = empty ? southeast_in : diagonal;

endmodule


// Based on incoming attacks, propagate a priority level.
module recv (
    input  wire [3:0] piece_reg,
    input  wire       op,
    input  wire       enable_reg,
    input  wire       manhattan,
    input  wire       diagonal,
    input  wire       knight,
    input  wire       king,
    input  wire       pawn,
    input  wire       pawn_2sq,
    input  wire       pawn_cap,
    output reg  [2:0] priority_,
    output reg        illegal
);

wire [2:0] piece = piece_reg[2:0];
wire color = piece_reg[3];

wire attacked  = |{manhattan, diagonal, knight, king, pawn_cap};
wire moved     = |{pawn, pawn_2sq};

always @* begin
    illegal = 0;
    if (!enable_reg) begin
        priority_ = 3'h0;
    end else if (op == `VICTIM) begin
        illegal = attacked && piece == `KING && color == `THEM;
        if (piece == `QUEEN && attacked && color == `THEM)
            priority_ = 6;
        else if (piece == `ROOK && attacked && color == `THEM)
            priority_ = 5;
        else if (piece == `BISHOP && attacked && color == `THEM)
            priority_ = 4;
        else if (piece == `KNIGHT && attacked && color == `THEM)
            priority_ = 3;
        else if (piece == `PAWN && attacked && color == `THEM)
            priority_ = 2;
        else if (piece == `EMPTY && (attacked || moved))
            priority_ = 1;
        else
            priority_ = 0;
    end else begin
        if (piece == `PAWN && |{pawn_cap, pawn, pawn_2sq} && color == `US)
            priority_ = 6;
        else if (piece == `KNIGHT && knight && color == `US)
            priority_ = 5;
        else if (piece == `BISHOP && diagonal && color == `US)
            priority_ = 4;
        else if (piece == `ROOK && manhattan && color == `US)
            priority_ = 3;
        else if (piece == `QUEEN && (diagonal || manhattan) && color == `US)
            priority_ = 2;
        else if (piece == `KING && king && color == `US)
            priority_ = 1;
        else
            priority_ = 0;
    end
end

endmodule


module stage (
    input  wire [31:0] piece_reg,
    input  wire [7:0]  enable_reg,
    input  wire        op,
    input  wire [5:0]  xmit_addr,
    input  wire [2:0]  rank,
    input  wire [7:0]  south_in,
    input  wire [7:0]  southeast_in,
    input  wire [7:0]  southwest_in,
    input  wire [7:0]  knight_in,
    input  wire [7:0]  king_in,
    input  wire [7:0]  pawn_in,
    input  wire [7:0]  pawn_2sq_in,
    output wire [7:0]  north_out,
    output wire [7:0]  northeast_out,
    output wire [7:0]  northwest_out,
    output wire [7:0]  knight_out,
    output wire [7:0]  king_out,
    output wire [7:0]  pawn_out,
    output wire [7:0]  pawn_2sq_out,
    output wire [23:0] priority_,
    output wire [7:0]  illegal
);

wire [7:0] east_out;

generate
    genvar file;
    for (file = 0; file < 8; file = file + 1) begin:blk_file
        xmit_half transmitter (
            .piece_reg(piece_reg[4*file +: 4]),
            .op(op),
            .xmit_addr(xmit_addr == {rank, file[2:0]}),
            .rank(rank),
            .south_in(south_in[file]),
            .west_in(file > 0 ? east_out[file-1] : 1'b0),
            .southeast_in(southeast_in[file]),
            .southwest_in(southwest_in[file]),
            .north_out(north_out[file]),
            .east_out(east_out[file]),
            .northeast_out(northeast_out[file]),
            .northwest_out(northwest_out[file]),
            .knight(knight_out[file]),
            .king(king_out[file]),
            .pawn(pawn_out[file]),
            .pawn_2sq(pawn_2sq_out[file])
        );

        wire manhattan = |{
            file > 0 ? east_out[file-1] : 1'b0,
            south_in[file]
        };

        wire diagonal = |{
            southeast_in[file],
            southwest_in[file]
        };

        wire pawn_cap = |{
            file > 0 ? pawn_in[file-1] : 1'b0,
            file < 7 ? pawn_in[file+1] : 1'b0
        };

        recv receiver (
            .piece_reg(piece_reg[4*file +: 4]),
            .op(op),
            .enable_reg(enable_reg[file]),
            .manhattan(manhattan),
            .diagonal(diagonal),
            .knight(knight_in[file]),
            .king(king_in[file] | (file > 0 ? king_out[file-1] : 1'b0)),
            .pawn(pawn_in[file]),
            .pawn_2sq(pawn_2sq_in[file]),
            .pawn_cap(pawn_cap),
            .priority_(priority_[3*file +: 3]),
            .illegal(illegal[file])
        );
    end
endgenerate

endmodule


// Decide the priority for a single square.
module arb_unit (
    input  wire [2:0] prio_in,
    input  wire [5:0] square_in,
    input  wire [2:0] priority_,
    input  wire [5:0] square,
    output reg  [2:0] prio_out,
    output reg  [5:0] square_out
);

always @* begin
    if (priority_ > prio_in) begin
        prio_out = priority_;
        square_out = square;
    end else begin
        prio_out = prio_in;
        square_out = square_in;
    end
end

endmodule


// Decide the priority for all squares.
module arb (
    input  wire [2:0]  priority_in,
    input  wire [5:0]  square_in,
    input  wire [95:0] priority_up,
    input  wire [2:0]  rank_up,
    output wire [2:0]  priority_out,
    output wire [6:0]  data_out
);

wire [95:0] prio_in = {priority_up};
wire [95:0] prio_out;
/* verilator lint_off UNUSEDSIGNAL */
wire [95:0] rank_in = {32{rank_up}}; // not all bits used
/* verilator lint_on UNUSEDSIGNAL */
wire [191:0] sq_out;

assign data_out[5:0] = sq_out[191:186];
assign data_out[6] = prio_out[95:93] == 0;
assign priority_out = prio_out[95:93];

generate
    genvar chain;
    for (chain = 0; chain < 32; chain = chain + 1) begin:arb
        arb_unit unit (
            .prio_in(chain == 0 ? priority_in : prio_out[3*(chain-1) +: 3]),
            .square_in(chain == 0 ? square_in : sq_out[6*(chain-1) +: 6]),
            .priority_(prio_in[3*chain +: 3]),
            .square({rank_in[3*chain+2], chain[4:0]}),
            .prio_out(prio_out[3*chain +: 3]),
            .square_out(sq_out[6*chain +: 6])
        );
    end
endgenerate

endmodule


module tt_um_chess (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    /* verilator lint_off UNUSEDSIGNAL */
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    /* verilator lint_on UNUSEDSIGNAL */
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

reg [255:0] piece_reg;
reg [63:0] enable_reg;
reg op;
reg [5:0] xmit_addr;

/* verilator lint_off UNUSEDSIGNAL */
wire [7:0] addr; // not all bits used.
/* verilator lint_on UNUSEDSIGNAL */
wire [7:0] data_in;
reg  [7:0] data_out;

// uio used as extra input bits.
assign addr     = ui_in;
assign data_in  = uio_in;
assign uo_out   = data_out;
assign uio_out  = 0;
assign uio_oe   = 0;

reg  [2:0]  rank_up;
reg  [7:0]  southeast_up, south_up, southwest_up, knight_up1, knight_up, king_up, pawn_up;
/* verilator lint_off UNUSEDSIGNAL */
wire [7:0]  northeast_one, north_one, northwest_one, knight_out_one, king_out_one, pawn_out_one, pawn_2sq_out_one;
/* verilator lint_off UNUSEDSIGNAL */
wire [23:0] priority_one;
wire [7:0]  illegal_one;

stage one (
    .piece_reg(piece_reg[32*rank_up +: 32]),
    .enable_reg(enable_reg[8*rank_up +: 8]),
    .op(op),
    .xmit_addr(xmit_addr),
    .rank(rank_up),
    .south_in(south_up),
    .southeast_in(southeast_up),
    .southwest_in(southwest_up),
    .knight_in(knight_up),
    .king_in(king_up),
    .pawn_in(pawn_up),
    .pawn_2sq_in(8'b0),
    .north_out(north_one),
    .northeast_out(northeast_one),
    .northwest_out(northwest_one),
    .knight_out(knight_out_one),
    .king_out(king_out_one),
    .pawn_out(pawn_out_one),
    .pawn_2sq_out(pawn_2sq_out_one),
    .priority_(priority_one),
    .illegal(illegal_one)
);

wire [5:0]  rank_plus_one = {3'b0, rank_up} + 1;
/* verilator lint_off UNUSEDSIGNAL */
wire [7:0]  northeast_two, north_two, northwest_two, knight_out_two, king_out_two, pawn_out_two, pawn_2sq_out_two;
/* verilator lint_off UNUSEDSIGNAL */
wire [23:0] priority_two;
wire [7:0]  illegal_two;


stage two (
    .piece_reg(piece_reg[32*rank_plus_one +: 32]),
    .enable_reg(enable_reg[8*rank_plus_one +: 8]),
    .op(op),
    .xmit_addr(xmit_addr),
    .rank(rank_plus_one[2:0]),
    .south_in(north_one),
    .southeast_in({1'b0, northwest_one[7:1]}),
    .southwest_in({northeast_one[6:0], 1'b0}),
    .knight_in({2'b0, knight_out_one[7:2]} | {knight_out_one[5:0], 2'b0} | knight_up1),
    .king_in({1'b0, king_out_one[7:1]} | {king_out_one[6:0], 1'b0} | king_out_one),
    .pawn_in(pawn_out_one),
    .pawn_2sq_in(8'b0),
    .north_out(north_two),
    .northeast_out(northeast_two),
    .northwest_out(northwest_two),
    .knight_out(knight_out_two),
    .king_out(king_out_two),
    .pawn_out(pawn_out_two),
    .pawn_2sq_out(pawn_2sq_out_two),
    .priority_(priority_two),
    .illegal(illegal_two)
);

wire [5:0]  rank_plus_two = {3'b0, rank_up} + 2;
/* verilator lint_off UNUSEDSIGNAL */
wire [7:0]  northeast_three, north_three, northwest_three, knight_out_three, king_out_three, pawn_out_three, pawn_2sq_out_three;
/* verilator lint_off UNUSEDSIGNAL */
wire [23:0] priority_three;
wire [7:0]  illegal_three;


stage three (
    .piece_reg(piece_reg[32*rank_plus_two +: 32]),
    .enable_reg(enable_reg[8*rank_plus_two +: 8]),
    .op(op),
    .xmit_addr(xmit_addr),
    .rank(rank_plus_two[2:0]),
    .south_in(north_two),
    .southeast_in({1'b0, northwest_two[7:1]}),
    .southwest_in({northeast_two[6:0], 1'b0}),
    .knight_in({2'b0, knight_out_two[7:2]} | {knight_out_two[5:0], 2'b0} | {1'b0, knight_out_one[7:1]} | {knight_out_one[6:0], 1'b0}),
    .king_in({1'b0, king_out_two[7:1]} | {king_out_two[6:0], 1'b0} | king_out_two),
    .pawn_in(pawn_out_two),
    .pawn_2sq_in(8'b0),
    .north_out(north_three),
    .northeast_out(northeast_three),
    .northwest_out(northwest_three),
    .knight_out(knight_out_three),
    .king_out(king_out_three),
    .pawn_out(pawn_out_three),
    .pawn_2sq_out(pawn_2sq_out_three),
    .priority_(priority_three),
    .illegal(illegal_three)
);

wire [5:0]  rank_plus_three = {3'b0, rank_up} + 3;
/* verilator lint_off UNUSEDSIGNAL */
wire [7:0]  northeast_up, north_up, northwest_up, knight_out_up, king_out_up, pawn_out_up, pawn_2sq_out_up;
/* verilator lint_off UNUSEDSIGNAL */
wire [23:0] priority_up;
wire [7:0]  illegal_up;


stage four (
    .piece_reg(piece_reg[32*rank_plus_three +: 32]),
    .enable_reg(enable_reg[8*rank_plus_three +: 8]),
    .op(op),
    .xmit_addr(xmit_addr),
    .rank(rank_plus_three[2:0]),
    .south_in(north_three),
    .southeast_in({1'b0, northwest_three[7:1]}),
    .southwest_in({northeast_three[6:0], 1'b0}),
    .knight_in({2'b0, knight_out_three[7:2]} | {knight_out_three[5:0], 2'b0} | {1'b0, knight_out_two[7:1]} | {knight_out_two[6:0], 1'b0}),
    .king_in({1'b0, king_out_three[7:1]} | {king_out_three[6:0], 1'b0} | king_out_three),
    .pawn_in(pawn_out_three),
    .pawn_2sq_in(pawn_2sq_out_two),
    .north_out(north_up),
    .northeast_out(northeast_up),
    .northwest_out(northwest_up),
    .knight_out(knight_out_up),
    .king_out(king_out_up),
    .pawn_out(pawn_out_up),
    .pawn_2sq_out(pawn_2sq_out_up),
    .priority_(priority_up),
    .illegal(illegal_up)
);

reg  [2:0] priority_;
wire [2:0] priority_out;
wire [6:0] data_out_next;

arb arbitrator (
    .priority_in(priority_),
    .square_in(data_out[5:0]),
    .priority_up({priority_up, priority_three, priority_two, priority_one}),
    .rank_up(rank_up),
    .priority_out(priority_out),
    .data_out(data_out_next)
);

// Address   / Data
// 0b1111__NN NNNN____: FIND-SRC; N is the transmitter to select
// 0b1110____ ________: FIND-DST
// 0b1101__NN NNNN___V: SET-ENABLE; N is the square to set; V is the value
// 0b1100____ ________: ENABLE-ALL
// 0b1011__NN NNNNVVVV: SET-SQUARE, N is the square to set; value to set in data
// 0b1010____ ________: ROTATE-BOARD
// 0b1001____ ________: FLIP-COLORS
// 0b1000____ ________: ENABLE-FRIENDLY
// 0b0111____ ________: SPILL-ENABLE
// 0b0110____ ________: FILL-ENABLE
// 0b0101__NN NNNN____: GET-SQUARE
// 0b00______ ________: NO-OP

// Nice to have:
// read-enable

wire [255:0] piece_reg_rotated;
wire [63:0]  enable_reg_rotated;
wire [255:0] piece_reg_colorflipped;
wire [63:0]  friendly_pieces;
reg  [5:0]   rotated;

generate
    genvar i;
    for (i = 0; i < 64; i = i + 1) begin
        localparam j = i ^ 63;
        assign piece_reg_rotated[4*i +: 4]      = piece_reg[4*j +: 4];
        assign enable_reg_rotated[i]            = enable_reg[j];
        assign piece_reg_colorflipped[4*i +: 4] = piece_reg[4*i +: 4] ^ 4'b1000;
        assign friendly_pieces[i]               = piece_reg[4*i+3] == `US;
    end
endgenerate

reg [1:0] state;
always @(posedge clk) begin
    // move generator state
    rank_up      <= 0;
    southeast_up <= 0;
    south_up     <= 0;
    southwest_up <= 0;
    knight_up1   <= 0;
    knight_up    <= 0;
    king_up      <= 0;
    pawn_up      <= 0;

    // arbitrator state
    priority_    <= 0;

    if (!rst_n) begin
        data_out   <= 0;
        piece_reg  <= ~256'b0;
        enable_reg <= ~64'b0;
        op         <= 0;
        xmit_addr  <= 0;
        state      <= 0;
        rotated    <= 0;
    end else begin
        casez (state)
        0: begin
            casez (addr[7:4])
            4'b111?: begin
                op <= addr[4];
                xmit_addr <= ({addr[1:0], data_in[7:4]}) ^ rotated;
                state <= 1;
            end
            4'b1101:
                enable_reg[{addr[1:0], data_in[7:4]} ^ rotated] <= data_in[0];
            4'b1100:
                enable_reg <= ~64'd0;
            4'b1011:
                piece_reg[4*({addr[1:0], data_in[7:4]} ^ rotated) +: 4] <= data_in[3:0];
            4'b1010: begin
                piece_reg  <= piece_reg_rotated;
                enable_reg <= enable_reg_rotated;
                rotated    <= ~rotated;
            end
            4'b1001:
                piece_reg <= piece_reg_colorflipped;
            4'b1000:
                enable_reg <= enable_reg | friendly_pieces;
            4'b0111:
                state <= 2;
            4'b0110:
                state <= 3;
            4'b0101:
                data_out <= {4'b0, piece_reg[4*({addr[1:0], data_in[7:4]} ^ rotated) +: 4]};
            4'b0100:
                /* reserved for future expansion */;
            4'b00??:
                /* NO-OP */;
            endcase
        end
        1: begin
            rank_up      <= rank_up + 4;
            southeast_up <= {1'b0, northwest_up[7:1]};
            south_up     <= north_up;
            southwest_up <= {northeast_up[6:0], 1'b0};
            knight_up1   <= {1'b0, knight_out_up[7:1]} | {knight_out_up[6:0], 1'b0};
            knight_up    <= {2'b0, knight_out_up[7:2]} | {knight_out_up[5:0], 2'b0} | {1'b0, knight_out_three[7:1]} | {knight_out_three[6:0], 1'b0};
            king_up      <= {1'b0, king_out_up[7:1]}   | {king_out_up[6:0], 1'b0}   | king_out_up;
            pawn_up      <= pawn_out_up;
            priority_    <= priority_out;
            data_out     <= {data_out[7] | |illegal_one | |illegal_two | |illegal_three | |illegal_up, data_out_next};
            if (rank_up == 4) begin
                data_out <= {data_out[7] | |illegal_one | |illegal_two | |illegal_three | |illegal_up, data_out_next ^ {1'b0, rotated}};
                state    <= 0;
            end
        end
        2: begin
            rank_up  <= rank_up + 1;
            data_out <= enable_reg[8*rank_up +: 8];
            if (rank_up == 7)
                state <= 0;
        end
        3: begin
            rank_up  <= rank_up + 1;
            enable_reg[8*rank_up +: 8] <= data_in;
            if (rank_up == 7)
                state <= 0;
        end
        endcase
    end
end

endmodule
