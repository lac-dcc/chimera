// This program was cloned from: https://github.com/scarv/xcrypto
// License: MIT License


module xc_aessub_ftb (

input clock,
input reset

);

wire        flush = valid && dut_ready; // Flush internal state
reg         valid = $anyseq; // Are the inputs valid?
reg [31:0]  rs1   = $anyseq; // Input source register 1
reg [31:0]  rs2   = $anyseq; // Input source register 2
reg         enc   = $anyseq; // Perform encrypt (set) or decrypt (clear).
reg         rot   = $anyseq; // Perform Rotation (set) or not (clear)
reg [31:0] flush_data = $anyseq;

initial     assume(reset == 1'b1);

always @(posedge clock) begin
    if($past(valid) && !$past(dut_ready)) begin
        assume($stable(valid));
        assume($stable(rs1));
        assume($stable(rs2));
        assume($stable(enc));
        assume($stable(rot));
    end
end

wire        dut_sel = $anyconst;

wire        dut_0_ready ; // Is the instruction complete?
wire [31:0] dut_0_result; // 

wire        dut_1_ready ; // Is the instruction complete?
wire [31:0] dut_1_result; // 

wire        dut_ready  = dut_sel ? dut_1_ready  : dut_0_ready  ;
wire [31:0] dut_result = dut_sel ? dut_1_result : dut_0_result ;

wire        grm_ready ; // Is the instruction complete?
wire [31:0] grm_result; // 

//
// Correctness assertions.
always @(posedge clock) begin
    // Assume that the GRM computes the result immediately. Hence, if
    // the DUT is ready, the GRM is also ready.
    if(!reset && valid && dut_ready && dut_sel) begin // DUT 1
        if(enc) begin
            if(rot) begin
                assert(grm_result == dut_result);
                cover (grm_result == dut_result);
            end else begin
              assert(grm_result == dut_result);
              cover (grm_result == dut_result);
            end
        end else begin
            if(rot) begin
                assert(grm_result == dut_result);
                cover (grm_result == dut_result);
            end else begin
                assert(grm_result == dut_result);
                cover (grm_result == dut_result);
            end
        end
    end
    
    if(!reset && valid && dut_ready && !dut_sel) begin // DUT 0
        if(enc) begin
            if(rot) begin
                assert(grm_result == dut_result);
                cover (grm_result == dut_result);
            end else begin
              assert(grm_result == dut_result);
              cover (grm_result == dut_result);
            end
        end else begin
            if(rot) begin
                assert(grm_result == dut_result);
                cover (grm_result == dut_result);
            end else begin
                assert(grm_result == dut_result);
                cover (grm_result == dut_result);
            end
        end
    end
end

//
// Stability / fairness restrictions.
always @(posedge clock) begin
    if(!reset && $past(valid) && valid && !$past(grm_ready)) begin
        // Inputs must be stable while output not ready.
        assume($stable(valid));
        assume($stable(rs2));
        assume($stable(rs1));
        assume($stable(enc));
        assume($stable(rot));
    end
end

//
// DUT 0 instantation - FAST
xc_aessub #(
.FAST(1'b1)
) i_dut_0(
.clock (clock       ),
.reset (reset       ),
.flush (flush       ), // 
.flush_data(flush_data),
.valid (valid       ), // Are the inputs valid?
.rs1   (rs1         ), // Input source register 1
.rs2   (rs2         ), // Input source register 2
.enc   (enc         ), // Perform encrypt (set) or decrypt (clear).
.rot   (rot         ), // Perform encrypt (set) or decrypt (clear).
.ready (dut_0_ready ), // Is the instruction complete?
.result(dut_0_result)  // 
);

//
// DUT 1 instantation - Area optimised
xc_aessub #(
.FAST(1'b0)
) i_dut_1(
.clock (clock       ),
.reset (reset       ),
.flush (flush       ), // 
.flush_data(flush_data),
.valid (valid       ), // Are the inputs valid?
.rs1   (rs1         ), // Input source register 1
.rs2   (rs2         ), // Input source register 2
.enc   (enc         ), // Perform encrypt (set) or decrypt (clear).
.rot   (rot         ), // Perform encrypt (set) or decrypt (clear).
.ready (dut_1_ready ), // Is the instruction complete?
.result(dut_1_result)  // 
);

//
// DUT instantation
xc_aessub_checker i_grm(
.clock (clock     ),
.reset (reset     ),
.valid (valid     ), // Are the inputs valid?
.rs1   (rs1       ), // Input source register 1
.rs2   (rs2       ), // Input source register 2
.enc   (enc       ), // Perform encrypt (set) or decrypt (clear).
.rot   (rot       ), // Perform encrypt (set) or decrypt (clear).
.ready (grm_ready ), // Is the instruction complete?
.result(grm_result)  // 
);


endmodule

module xc_aessub_checker (

input  wire        clock ,
input  wire        reset ,

input  wire        valid , // Are the inputs valid?
input  wire [31:0] rs1   , // Input source register 1
input  wire [31:0] rs2   , // Input source register 2
input  wire        enc   , // Perform encrypt (set) or decrypt (clear).
input  wire        rot   , // Perform encrypt (set) or decrypt (clear).
output wire        ready , // Is the instruction complete?
output wire [31:0] result  // 

);

// GRM always completes in a single cycle.
assign ready = valid;

wire [7:0] sb_in_0 = rs1[ 7: 0];
wire [7:0] sb_in_1 = rs2[15: 8];
wire [7:0] sb_in_2 = rs1[23:16];
wire [7:0] sb_in_3 = rs2[31:24];

wire [7:0] sb_out_0;
wire [7:0] sb_out_1;
wire [7:0] sb_out_2;
wire [7:0] sb_out_3;

assign result = rot ? {sb_out_2, sb_out_1, sb_out_0, sb_out_3} :
                      {sb_out_3, sb_out_2, sb_out_1, sb_out_0} ;

xc_aessub_sbox_checker sbox_0(
.in  (sb_in_0 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_0)  // Output byte
);

xc_aessub_sbox_checker sbox_1(
.in  (sb_in_1 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_1)  // Output byte
);

xc_aessub_sbox_checker sbox_2(
.in  (sb_in_2 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_2)  // Output byte
);

xc_aessub_sbox_checker sbox_3(
.in  (sb_in_3 ), // Input byte
.inv (!enc    ), // Perform inverse (set) or forward lookup
.out (sb_out_3)  // Output byte
);

endmodule


//
// Naieve single 1-byte lookup for the AES SBox or inverse SBox
module xc_aessub_sbox_checker(
input  wire [7:0] in    ,   // Input byte
input  wire       inv   ,   // Perform inverse (set) or forward lookup
output wire [7:0] out       // Output byte
);

reg  [7:0] out_fwd;
reg  [7:0] out_inv;

assign out = inv ? out_inv : out_fwd;

always @(*) begin
    case(in)
        0  : out_fwd = 8'h63;
        1  : out_fwd = 8'h7c;
        2  : out_fwd = 8'h77;
        3  : out_fwd = 8'h7b;
        4  : out_fwd = 8'hf2;
        5  : out_fwd = 8'h6b;
        6  : out_fwd = 8'h6f;
        7  : out_fwd = 8'hc5;
        8  : out_fwd = 8'h30;
        9  : out_fwd = 8'h01;
        10 : out_fwd = 8'h67;
        11 : out_fwd = 8'h2b;
        12 : out_fwd = 8'hfe;
        13 : out_fwd = 8'hd7;
        14 : out_fwd = 8'hab;
        15 : out_fwd = 8'h76;
        16 : out_fwd = 8'hca;
        17 : out_fwd = 8'h82;
        18 : out_fwd = 8'hc9;
        19 : out_fwd = 8'h7d;
        20 : out_fwd = 8'hfa;
        21 : out_fwd = 8'h59;
        22 : out_fwd = 8'h47;
        23 : out_fwd = 8'hf0;
        24 : out_fwd = 8'had;
        25 : out_fwd = 8'hd4;
        26 : out_fwd = 8'ha2;
        27 : out_fwd = 8'haf;
        28 : out_fwd = 8'h9c;
        29 : out_fwd = 8'ha4;
        30 : out_fwd = 8'h72;
        31 : out_fwd = 8'hc0;
        32 : out_fwd = 8'hb7;
        33 : out_fwd = 8'hfd;
        34 : out_fwd = 8'h93;
        35 : out_fwd = 8'h26;
        36 : out_fwd = 8'h36;
        37 : out_fwd = 8'h3f;
        38 : out_fwd = 8'hf7;
        39 : out_fwd = 8'hcc;
        40 : out_fwd = 8'h34;
        41 : out_fwd = 8'ha5;
        42 : out_fwd = 8'he5;
        43 : out_fwd = 8'hf1;
        44 : out_fwd = 8'h71;
        45 : out_fwd = 8'hd8;
        46 : out_fwd = 8'h31;
        47 : out_fwd = 8'h15;
        48 : out_fwd = 8'h04;
        49 : out_fwd = 8'hc7;
        50 : out_fwd = 8'h23;
        51 : out_fwd = 8'hc3;
        52 : out_fwd = 8'h18;
        53 : out_fwd = 8'h96;
        54 : out_fwd = 8'h05;
        55 : out_fwd = 8'h9a;
        56 : out_fwd = 8'h07;
        57 : out_fwd = 8'h12;
        58 : out_fwd = 8'h80;
        59 : out_fwd = 8'he2;
        60 : out_fwd = 8'heb;
        61 : out_fwd = 8'h27;
        62 : out_fwd = 8'hb2;
        63 : out_fwd = 8'h75;
        64 : out_fwd = 8'h09;
        65 : out_fwd = 8'h83;
        66 : out_fwd = 8'h2c;
        67 : out_fwd = 8'h1a;
        68 : out_fwd = 8'h1b;
        69 : out_fwd = 8'h6e;
        70 : out_fwd = 8'h5a;
        71 : out_fwd = 8'ha0;
        72 : out_fwd = 8'h52;
        73 : out_fwd = 8'h3b;
        74 : out_fwd = 8'hd6;
        75 : out_fwd = 8'hb3;
        76 : out_fwd = 8'h29;
        77 : out_fwd = 8'he3;
        78 : out_fwd = 8'h2f;
        79 : out_fwd = 8'h84;
        80 : out_fwd = 8'h53;
        81 : out_fwd = 8'hd1;
        82 : out_fwd = 8'h00;
        83 : out_fwd = 8'hed;
        84 : out_fwd = 8'h20;
        85 : out_fwd = 8'hfc;
        86 : out_fwd = 8'hb1;
        87 : out_fwd = 8'h5b;
        88 : out_fwd = 8'h6a;
        89 : out_fwd = 8'hcb;
        90 : out_fwd = 8'hbe;
        91 : out_fwd = 8'h39;
        92 : out_fwd = 8'h4a;
        93 : out_fwd = 8'h4c;
        94 : out_fwd = 8'h58;
        95 : out_fwd = 8'hcf;
        96 : out_fwd = 8'hd0;
        97 : out_fwd = 8'hef;
        98 : out_fwd = 8'haa;
        99 : out_fwd = 8'hfb;
        100: out_fwd = 8'h43;
        101: out_fwd = 8'h4d;
        102: out_fwd = 8'h33;
        103: out_fwd = 8'h85;
        104: out_fwd = 8'h45;
        105: out_fwd = 8'hf9;
        106: out_fwd = 8'h02;
        107: out_fwd = 8'h7f;
        108: out_fwd = 8'h50;
        109: out_fwd = 8'h3c;
        110: out_fwd = 8'h9f;
        111: out_fwd = 8'ha8;
        112: out_fwd = 8'h51;
        113: out_fwd = 8'ha3;
        114: out_fwd = 8'h40;
        115: out_fwd = 8'h8f;
        116: out_fwd = 8'h92;
        117: out_fwd = 8'h9d;
        118: out_fwd = 8'h38;
        119: out_fwd = 8'hf5;
        120: out_fwd = 8'hbc;
        121: out_fwd = 8'hb6;
        122: out_fwd = 8'hda;
        123: out_fwd = 8'h21;
        124: out_fwd = 8'h10;
        125: out_fwd = 8'hff;
        126: out_fwd = 8'hf3;
        127: out_fwd = 8'hd2;
        128: out_fwd = 8'hcd;
        129: out_fwd = 8'h0c;
        130: out_fwd = 8'h13;
        131: out_fwd = 8'hec;
        132: out_fwd = 8'h5f;
        133: out_fwd = 8'h97;
        134: out_fwd = 8'h44;
        135: out_fwd = 8'h17;
        136: out_fwd = 8'hc4;
        137: out_fwd = 8'ha7;
        138: out_fwd = 8'h7e;
        139: out_fwd = 8'h3d;
        140: out_fwd = 8'h64;
        141: out_fwd = 8'h5d;
        142: out_fwd = 8'h19;
        143: out_fwd = 8'h73;
        144: out_fwd = 8'h60;
        145: out_fwd = 8'h81;
        146: out_fwd = 8'h4f;
        147: out_fwd = 8'hdc;
        148: out_fwd = 8'h22;
        149: out_fwd = 8'h2a;
        150: out_fwd = 8'h90;
        151: out_fwd = 8'h88;
        152: out_fwd = 8'h46;
        153: out_fwd = 8'hee;
        154: out_fwd = 8'hb8;
        155: out_fwd = 8'h14;
        156: out_fwd = 8'hde;
        157: out_fwd = 8'h5e;
        158: out_fwd = 8'h0b;
        159: out_fwd = 8'hdb;
        160: out_fwd = 8'he0;
        161: out_fwd = 8'h32;
        162: out_fwd = 8'h3a;
        163: out_fwd = 8'h0a;
        164: out_fwd = 8'h49;
        165: out_fwd = 8'h06;
        166: out_fwd = 8'h24;
        167: out_fwd = 8'h5c;
        168: out_fwd = 8'hc2;
        169: out_fwd = 8'hd3;
        170: out_fwd = 8'hac;
        171: out_fwd = 8'h62;
        172: out_fwd = 8'h91;
        173: out_fwd = 8'h95;
        174: out_fwd = 8'he4;
        175: out_fwd = 8'h79;
        176: out_fwd = 8'he7;
        177: out_fwd = 8'hc8;
        178: out_fwd = 8'h37;
        179: out_fwd = 8'h6d;
        180: out_fwd = 8'h8d;
        181: out_fwd = 8'hd5;
        182: out_fwd = 8'h4e;
        183: out_fwd = 8'ha9;
        184: out_fwd = 8'h6c;
        185: out_fwd = 8'h56;
        186: out_fwd = 8'hf4;
        187: out_fwd = 8'hea;
        188: out_fwd = 8'h65;
        189: out_fwd = 8'h7a;
        190: out_fwd = 8'hae;
        191: out_fwd = 8'h08;
        192: out_fwd = 8'hba;
        193: out_fwd = 8'h78;
        194: out_fwd = 8'h25;
        195: out_fwd = 8'h2e;
        196: out_fwd = 8'h1c;
        197: out_fwd = 8'ha6;
        198: out_fwd = 8'hb4;
        199: out_fwd = 8'hc6;
        200: out_fwd = 8'he8;
        201: out_fwd = 8'hdd;
        202: out_fwd = 8'h74;
        203: out_fwd = 8'h1f;
        204: out_fwd = 8'h4b;
        205: out_fwd = 8'hbd;
        206: out_fwd = 8'h8b;
        207: out_fwd = 8'h8a;
        208: out_fwd = 8'h70;
        209: out_fwd = 8'h3e;
        210: out_fwd = 8'hb5;
        211: out_fwd = 8'h66;
        212: out_fwd = 8'h48;
        213: out_fwd = 8'h03;
        214: out_fwd = 8'hf6;
        215: out_fwd = 8'h0e;
        216: out_fwd = 8'h61;
        217: out_fwd = 8'h35;
        218: out_fwd = 8'h57;
        219: out_fwd = 8'hb9;
        220: out_fwd = 8'h86;
        221: out_fwd = 8'hc1;
        222: out_fwd = 8'h1d;
        223: out_fwd = 8'h9e;
        224: out_fwd = 8'he1;
        225: out_fwd = 8'hf8;
        226: out_fwd = 8'h98;
        227: out_fwd = 8'h11;
        228: out_fwd = 8'h69;
        229: out_fwd = 8'hd9;
        230: out_fwd = 8'h8e;
        231: out_fwd = 8'h94;
        232: out_fwd = 8'h9b;
        233: out_fwd = 8'h1e;
        234: out_fwd = 8'h87;
        235: out_fwd = 8'he9;
        236: out_fwd = 8'hce;
        237: out_fwd = 8'h55;
        238: out_fwd = 8'h28;
        239: out_fwd = 8'hdf;
        240: out_fwd = 8'h8c;
        241: out_fwd = 8'ha1;
        242: out_fwd = 8'h89;
        243: out_fwd = 8'h0d;
        244: out_fwd = 8'hbf;
        245: out_fwd = 8'he6;
        246: out_fwd = 8'h42;
        247: out_fwd = 8'h68;
        248: out_fwd = 8'h41;
        249: out_fwd = 8'h99;
        250: out_fwd = 8'h2d;
        251: out_fwd = 8'h0f;
        252: out_fwd = 8'hb0;
        253: out_fwd = 8'h54;
        254: out_fwd = 8'hbb;
        255: out_fwd = 8'h16;
    endcase
end


always @(*) begin
    case(in)
        0  : out_inv = 8'h52;
        1  : out_inv = 8'h09;
        2  : out_inv = 8'h6a;
        3  : out_inv = 8'hd5;
        4  : out_inv = 8'h30;
        5  : out_inv = 8'h36;
        6  : out_inv = 8'ha5;
        7  : out_inv = 8'h38;
        8  : out_inv = 8'hbf;
        9  : out_inv = 8'h40;
        10 : out_inv = 8'ha3;
        11 : out_inv = 8'h9e;
        12 : out_inv = 8'h81;
        13 : out_inv = 8'hf3;
        14 : out_inv = 8'hd7;
        15 : out_inv = 8'hfb;
        16 : out_inv = 8'h7c;
        17 : out_inv = 8'he3;
        18 : out_inv = 8'h39;
        19 : out_inv = 8'h82;
        20 : out_inv = 8'h9b;
        21 : out_inv = 8'h2f;
        22 : out_inv = 8'hff;
        23 : out_inv = 8'h87;
        24 : out_inv = 8'h34;
        25 : out_inv = 8'h8e;
        26 : out_inv = 8'h43;
        27 : out_inv = 8'h44;
        28 : out_inv = 8'hc4;
        29 : out_inv = 8'hde;
        30 : out_inv = 8'he9;
        31 : out_inv = 8'hcb;
        32 : out_inv = 8'h54;
        33 : out_inv = 8'h7b;
        34 : out_inv = 8'h94;
        35 : out_inv = 8'h32;
        36 : out_inv = 8'ha6;
        37 : out_inv = 8'hc2;
        38 : out_inv = 8'h23;
        39 : out_inv = 8'h3d;
        40 : out_inv = 8'hee;
        41 : out_inv = 8'h4c;
        42 : out_inv = 8'h95;
        43 : out_inv = 8'h0b;
        44 : out_inv = 8'h42;
        45 : out_inv = 8'hfa;
        46 : out_inv = 8'hc3;
        47 : out_inv = 8'h4e;
        48 : out_inv = 8'h08;
        49 : out_inv = 8'h2e;
        50 : out_inv = 8'ha1;
        51 : out_inv = 8'h66;
        52 : out_inv = 8'h28;
        53 : out_inv = 8'hd9;
        54 : out_inv = 8'h24;
        55 : out_inv = 8'hb2;
        56 : out_inv = 8'h76;
        57 : out_inv = 8'h5b;
        58 : out_inv = 8'ha2;
        59 : out_inv = 8'h49;
        60 : out_inv = 8'h6d;
        61 : out_inv = 8'h8b;
        62 : out_inv = 8'hd1;
        63 : out_inv = 8'h25;
        64 : out_inv = 8'h72;
        65 : out_inv = 8'hf8;
        66 : out_inv = 8'hf6;
        67 : out_inv = 8'h64;
        68 : out_inv = 8'h86;
        69 : out_inv = 8'h68;
        70 : out_inv = 8'h98;
        71 : out_inv = 8'h16;
        72 : out_inv = 8'hd4;
        73 : out_inv = 8'ha4;
        74 : out_inv = 8'h5c;
        75 : out_inv = 8'hcc;
        76 : out_inv = 8'h5d;
        77 : out_inv = 8'h65;
        78 : out_inv = 8'hb6;
        79 : out_inv = 8'h92;
        80 : out_inv = 8'h6c;
        81 : out_inv = 8'h70;
        82 : out_inv = 8'h48;
        83 : out_inv = 8'h50;
        84 : out_inv = 8'hfd;
        85 : out_inv = 8'hed;
        86 : out_inv = 8'hb9;
        87 : out_inv = 8'hda;
        88 : out_inv = 8'h5e;
        89 : out_inv = 8'h15;
        90 : out_inv = 8'h46;
        91 : out_inv = 8'h57;
        92 : out_inv = 8'ha7;
        93 : out_inv = 8'h8d;
        94 : out_inv = 8'h9d;
        95 : out_inv = 8'h84;
        96 : out_inv = 8'h90;
        97 : out_inv = 8'hd8;
        98 : out_inv = 8'hab;
        99 : out_inv = 8'h00;
        100: out_inv = 8'h8c;
        101: out_inv = 8'hbc;
        102: out_inv = 8'hd3;
        103: out_inv = 8'h0a;
        104: out_inv = 8'hf7;
        105: out_inv = 8'he4;
        106: out_inv = 8'h58;
        107: out_inv = 8'h05;
        108: out_inv = 8'hb8;
        109: out_inv = 8'hb3;
        110: out_inv = 8'h45;
        111: out_inv = 8'h06;
        112: out_inv = 8'hd0;
        113: out_inv = 8'h2c;
        114: out_inv = 8'h1e;
        115: out_inv = 8'h8f;
        116: out_inv = 8'hca;
        117: out_inv = 8'h3f;
        118: out_inv = 8'h0f;
        119: out_inv = 8'h02;
        120: out_inv = 8'hc1;
        121: out_inv = 8'haf;
        122: out_inv = 8'hbd;
        123: out_inv = 8'h03;
        124: out_inv = 8'h01;
        125: out_inv = 8'h13;
        126: out_inv = 8'h8a;
        127: out_inv = 8'h6b;
        128: out_inv = 8'h3a;
        129: out_inv = 8'h91;
        130: out_inv = 8'h11;
        131: out_inv = 8'h41;
        132: out_inv = 8'h4f;
        133: out_inv = 8'h67;
        134: out_inv = 8'hdc;
        135: out_inv = 8'hea;
        136: out_inv = 8'h97;
        137: out_inv = 8'hf2;
        138: out_inv = 8'hcf;
        139: out_inv = 8'hce;
        140: out_inv = 8'hf0;
        141: out_inv = 8'hb4;
        142: out_inv = 8'he6;
        143: out_inv = 8'h73;
        144: out_inv = 8'h96;
        145: out_inv = 8'hac;
        146: out_inv = 8'h74;
        147: out_inv = 8'h22;
        148: out_inv = 8'he7;
        149: out_inv = 8'had;
        150: out_inv = 8'h35;
        151: out_inv = 8'h85;
        152: out_inv = 8'he2;
        153: out_inv = 8'hf9;
        154: out_inv = 8'h37;
        155: out_inv = 8'he8;
        156: out_inv = 8'h1c;
        157: out_inv = 8'h75;
        158: out_inv = 8'hdf;
        159: out_inv = 8'h6e;
        160: out_inv = 8'h47;
        161: out_inv = 8'hf1;
        162: out_inv = 8'h1a;
        163: out_inv = 8'h71;
        164: out_inv = 8'h1d;
        165: out_inv = 8'h29;
        166: out_inv = 8'hc5;
        167: out_inv = 8'h89;
        168: out_inv = 8'h6f;
        169: out_inv = 8'hb7;
        170: out_inv = 8'h62;
        171: out_inv = 8'h0e;
        172: out_inv = 8'haa;
        173: out_inv = 8'h18;
        174: out_inv = 8'hbe;
        175: out_inv = 8'h1b;
        176: out_inv = 8'hfc;
        177: out_inv = 8'h56;
        178: out_inv = 8'h3e;
        179: out_inv = 8'h4b;
        180: out_inv = 8'hc6;
        181: out_inv = 8'hd2;
        182: out_inv = 8'h79;
        183: out_inv = 8'h20;
        184: out_inv = 8'h9a;
        185: out_inv = 8'hdb;
        186: out_inv = 8'hc0;
        187: out_inv = 8'hfe;
        188: out_inv = 8'h78;
        189: out_inv = 8'hcd;
        190: out_inv = 8'h5a;
        191: out_inv = 8'hf4;
        192: out_inv = 8'h1f;
        193: out_inv = 8'hdd;
        194: out_inv = 8'ha8;
        195: out_inv = 8'h33;
        196: out_inv = 8'h88;
        197: out_inv = 8'h07;
        198: out_inv = 8'hc7;
        199: out_inv = 8'h31;
        200: out_inv = 8'hb1;
        201: out_inv = 8'h12;
        202: out_inv = 8'h10;
        203: out_inv = 8'h59;
        204: out_inv = 8'h27;
        205: out_inv = 8'h80;
        206: out_inv = 8'hec;
        207: out_inv = 8'h5f;
        208: out_inv = 8'h60;
        209: out_inv = 8'h51;
        210: out_inv = 8'h7f;
        211: out_inv = 8'ha9;
        212: out_inv = 8'h19;
        213: out_inv = 8'hb5;
        214: out_inv = 8'h4a;
        215: out_inv = 8'h0d;
        216: out_inv = 8'h2d;
        217: out_inv = 8'he5;
        218: out_inv = 8'h7a;
        219: out_inv = 8'h9f;
        220: out_inv = 8'h93;
        221: out_inv = 8'hc9;
        222: out_inv = 8'h9c;
        223: out_inv = 8'hef;
        224: out_inv = 8'ha0;
        225: out_inv = 8'he0;
        226: out_inv = 8'h3b;
        227: out_inv = 8'h4d;
        228: out_inv = 8'hae;
        229: out_inv = 8'h2a;
        230: out_inv = 8'hf5;
        231: out_inv = 8'hb0;
        232: out_inv = 8'hc8;
        233: out_inv = 8'heb;
        234: out_inv = 8'hbb;
        235: out_inv = 8'h3c;
        236: out_inv = 8'h83;
        237: out_inv = 8'h53;
        238: out_inv = 8'h99;
        239: out_inv = 8'h61;
        240: out_inv = 8'h17;
        241: out_inv = 8'h2b;
        242: out_inv = 8'h04;
        243: out_inv = 8'h7e;
        244: out_inv = 8'hba;
        245: out_inv = 8'h77;
        246: out_inv = 8'hd6;
        247: out_inv = 8'h26;
        248: out_inv = 8'he1;
        249: out_inv = 8'h69;
        250: out_inv = 8'h14;
        251: out_inv = 8'h63;
        252: out_inv = 8'h55;
        253: out_inv = 8'h21;
        254: out_inv = 8'h0c;
        255: out_inv = 8'h7d;
    endcase
end

endmodule
