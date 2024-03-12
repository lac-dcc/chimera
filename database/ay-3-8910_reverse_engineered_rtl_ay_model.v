// (c) 2019 deathsoft, lvd

// This verilog model of the AY chip was made from the transistor-level schematics
// recreated by deathsoft. He used high-resolution photos of the AY's decapped die.
//
// The purpose of this model is to be as close to the schematics as possible,
// wihout ever trying to be synthesizable. Suitable only for simulations!
//
// As a consequence, the timing delays are used explicitly, however they do not
// relate in any way to the timing delays of the real chip. They are used only
// to achieve correct signal precedence in the places where this is important,
// like flip-flops or asynchronous self-reset circuits.
//
// Sound output is not analog (obviously!), instead codes 0..15 are used:
//  0 -- AY DAC output is disconnected (no current),
//  1..15 -- AY DAC output sources corresponding current level.
//   Every current level is determined by the size of the corresponding transistor. There are
//   15 transistors in total, only one of them is open at output levels 1..15 and no one at level 0.
//
// You need additional table lookups to convert these 0..15 levels to appropriate sound values.

// naming conventions: 
//  While in the schematics all names are upper-case, here they all are lower-case.
//
//  When name in schematics starts with / (inverse), here we use first _ (underscore), like
//  "/A9" becomes "_a9"
//
//  When there is obviously a bus of some type, it is bus also in verilog, like all
//  DA0, DA1,..., DA7 become "wire [7:0] da"

/*  This file is part of AY-3-8910 restoration and preservation project.

    AY-3-8910 restoration and preservation project is free software: you
    can redistribute it and/or modify it under the terms of the
    GNU General Public License as published by the Free Software Foundation,
    either version 3 of the License, or (at your option) any later version.

    AY-3-8910 restoration and preservation project is distributed in the
    hope that it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
    PURPOSE. See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Foobar.  If not, see <https://www.gnu.org/licenses/>.
*/



`timescale 100ns/1ns // arbitrary values, with the exception that the second time value must be
                     // 1/100 of the first one.


module ay_model
(
	// clock & reset
	input  wire       clk,   // Simple clock, AY outputs sound at clk/8 rate.
	                         // For example: at 1.75 MHz clock, sound rate will be 218.75 kHz

	input  wire       _rst,  // Negative asynchronous reset. When _rst=0, chip is under reset.
	                         // The reset will set all AY registers to zero,
	                         // initialize phases of tone and noise generators,
	                         // and initialize the phase of internal clk->clk/8 divider.

	// bus & control
	inout  wire [7:0] da,    // 8 bit I/O bus
	//
	input  wire       bdir,  // Asynchronous bus control signals. The AY captures data for the internal registers from 'da' bus
	input  wire       bc2,   // by driving enables on internal latches asynchronously by these signals.
	input  wire       bc1,   // Short help on using those signals:
	                         //
	                         // {bdir, bc2, bc1} | bus operation
	                         // -----------------+---------------
	                         //      either of   | Select register (number is da[3:0]) for subsequent read or write.
	                         //     0    0    1  | Selection only succeedes when da[7:4]==0,
	                         //     1    0    0  | a8=1 and _a9=0, otherwise AY gets 'unselected',
	                         //     1    1    1  | i.e. it won't react on subsequent reads or writes.
	                         // -----------------+---------------
	                         //     1    1    0  | write the contents of the 'da' bus into the previously selected AY register
	                         // -----------------+---------------
	                         //     0    1    1  | read contents of the previously selected AY register to the 'da' bus
	                         // -----------------+---------------
	                         // any other values | ignore anything on the bus and do not change selected register (idle state)
	                      
	input  wire       a8,    // additional selection signals, see above
	input  wire       _a9,   //

	// gpio
	inout  wire [7:0] ioa,   // bidirectional GPIO pins.
	inout  wire [7:0] iob,   // Unlike it is in real AY, there are no pullups on these pins.
	                         // If you need some, try using 'tri1' instead of 'wire'
	                         // for the signals that connect here.

	// test pins
	output wire       test1, // outputs the frequency that drives envelope state machine,
	                         // its frequency is Fclk/(16*envelope_period).

	input  wire       test2, // put here 1'b0 for normal work. Otherwise
	                         // AY won't do any register reads or writes, while
	                         // the register selections will still work.

	// sound outputs (see comments above)
	output wire [3:0] ch_a,  // Logical sound levels, from 0 to 15.
	output wire [3:0] ch_b,  // You need an additional table lookup if you want real
	output wire [3:0] ch_c   // sound levels.
	                         // Because AY is an asynchronous design and because here we
	                         // emulate the delays of internal latches where it is necessary,
	                         // there are glitches on these pins.
);


	wire rst_1; // actual internal reset

	wire f1,_f1; // internal clock phases

	wire cnt_clk; // short clk strobe

	wire _bdir,  _bc2,  _bc1;   // internal copies of bdir/bc2/bc1
	wire  bdir_1, bc2_1, bc1_1;

	wire psg_cs, _psg_cs;

	wire da_latch_wr, _da_latch_wr;

	wire psg_sel, _psg_sel;

	wire _da_out_en;
	wire reg_wr, _reg_wr, reg_wr_2;

	wire [3:0]  d_latch_1;
	wire [3:0] _d_latch_1;

	wire _internal_sel;

	wire  sel_r0,  sel_r1,  sel_r2,  sel_r3,
	      sel_r4,  sel_r5,  sel_r6,  sel_r7,
	     sel_r10, sel_r11, sel_r12, sel_r13,
	     sel_r14, sel_r15;

	wire _sel_r16, _sel_r17;

	//wire [7:0] b;
	trireg [7:0] b;

	wire [7:0] r7_b; // tone/noise enable

	wire [4:0]  noise_period; // noise period
	wire [4:0] _noise_period;

	wire noise_carry_out;

	wire noise_latch_up_phase, noise_latch_dn_phase;

	wire pre_f4;
	wire _f4,f4;


	wire [15:0]  env_period; // envelope period
	wire [15:0] _env_period;

	wire [3:0] env_mode; // envelope mode
	
	wire env_rst; // envelope reset

	wire ep_rst; // envelope period counter reset

	wire env_carry_out; // from period counter

	wire env_phase_up;
	wire env_phase_dn;

	wire f_env; // envelope frequency

	wire [3:0] e; // envelope volume level
	wire [3:0] e_mx; // pre-envelope 

	wire _env_en;
	
	wire  sel_ea;
	wire _sel_ea;

	wire f_env_dis; // enable envelope state machine clocking

	wire env_clk_up;
	wire env_clk_dn;




	wire _r7_b6_1, _r7_b7_1; // dir bits for GPIO
	wire wr_r16_1, _en_r16_rd; //extra signals to control GPIO registers
	wire wr_r17_1, _en_r17_rd; //

	wire noise; // noise bitstream

	wire [16:0] noise_reg; // noise latches





	/* RESET conditioning */
	assign rst_1 = ~_rst;



	/* CLOCK preconditioning and division */
	wire int_clk_n, int_clk_nn;

	wire int_clk_up,int_clk_dn; // inputs to division chain

	assign int_clk_n = ~clk;
	assign int_clk_nn = ~int_clk_n;

	ay_model_rs_ff in_clk_conditioning
	(
		.reset( int_clk_nn ),
		.  set( int_clk_n  ),
		.q    ( int_clk_dn ),
		._q   ( int_clk_up )
	);

	wire int_clk_div2_up, int_clk_div2_dn;

	ay_model_clk_ff ckdiv2
	(
		.up_phase(int_clk_up),
		.dn_phase(int_clk_dn),
		.set(1'b0),
		.rst(rst_1),
        
		.q_up(int_clk_div2_up),
		.q_dn(int_clk_div2_dn) 
	);

	wire int_clk_div4_up, int_clk_div4_dn;

	ay_model_clk_ff ckdiv4
	(
		.up_phase(int_clk_div2_up),
		.dn_phase(int_clk_div2_dn),
		.set(1'b0),
		.rst(rst_1),
        
		.q_up(int_clk_div4_up),
		.q_dn(int_clk_div4_dn) 
	);

	wire int_clk_div8_up, int_clk_div8_dn;

	ay_model_clk_ff ckdiv8
	(
		.up_phase(int_clk_div4_up),
		.dn_phase(int_clk_div4_dn),
		.set(1'b0),
		.rst(rst_1),
        
		.q_up(int_clk_div8_up),
		.q_dn(int_clk_div8_dn) 
	);

	// make output phases
	ay_model_rs_ff main_clk_phases
	(
		.reset(int_clk_div8_up),
		.  set(int_clk_div8_dn),
		.    q(_f1),
		.   _q( f1)
	);

	// make strobe
	assign cnt_clk = ~(int_clk_div2_up | int_clk_div4_up | int_clk_div8_dn);




	/* internal copies of BDIR BC1 BC2 */
	assign _bdir = ~bdir;
	assign _bc2  = ~bc2;
	assign _bc1  = ~bc1;

	assign bdir_1 = ~_bdir;
	assign bc2_1  = ~_bc2;
	assign bc1_1  = ~_bc1;




	/* PSG_CS and /PSG_CS */
	wire int__a9_1, int__a8;
	wire int_da7_4;

	assign int__a9_1 = _a9;
	assign int__a8 = ~a8;

	assign int_da7_4 = |da[7:4];

	assign  psg_cs = ~(int__a9_1 | int__a8 | int_da7_4);
	assign _psg_cs = ~psg_cs;



	/* DA_LATCH_WR and /DA_LATCH_WR */
	wire int_bsigs_001, // goes to 1 when {bdir,bc2,bc1} have corresponding pattern
	     int_bsigs_111, 
	     int_bsigs_100;

	wire int_bsigs_wracc;

	assign int_bsigs_001 = ~( bdir_1 | bc2_1 | _bc1  );
	assign int_bsigs_111 = ~( _bdir  | _bc2  | _bc1  );
	assign int_bsigs_100 = ~( _bdir  | bc2_1 | bc1_1 );

	assign int_bsigs_wracc = ~( int_bsigs_001 | int_bsigs_111 | int_bsigs_100 );

	assign  da_latch_wr = ~( _psg_cs | int_bsigs_wracc );
	assign _da_latch_wr = ~da_latch_wr;



	/* PSG_SEL and /PSG_SEL */
	wire int_psgwren_ffset,
	     int_psgwren_ffrst;
	
	wire int_psgwren_q;
	
	assign int_psgwren_ffset = ~( int_bsigs_wracc | psg_cs );
	assign int_psgwren_ffrst = da_latch_wr;

	ay_model_rs_ff make_psg_sel
	(
		.reset(int_psgwren_ffrst),
		.  set(int_psgwren_ffset | rst_1),
		.    q(int_psgwren_q ),
		.   _q(              )
	);

	assign  psg_sel = ~( int_psgwren_q | int_psgwren_ffrst );
	assign _psg_sel = ~psg_sel;



	/* /DA_OUT_EN, REG_WR and /REG_WR */
	wire int_psg_wr, int_psg_rd;

	wire int_pre_wr;

	assign int_psg_wr = ~(test2 | _bdir  | _bc2 | bc1_1); // 110
	assign int_psg_rd = ~(test2 | bdir_1 | _bc2 | _bc1 ); // 011

	assign _da_out_en = ~(int_psg_rd & psg_sel);

	assign int_pre_wr = ~(psg_sel & int_psg_wr);

	assign reg_wr = ~(int_pre_wr & (~rst_1));

	assign _reg_wr = ~reg_wr;

	

	/* REG_WR_2 */
	assign reg_wr_2 = ~_reg_wr;



	/* D0_LATCH_1, /D0_LATCH_1, ..., D3_LATCH_1, /D3_LATCH_1 */
	wire [3:0] int_reg_addr_pos;
	wire [3:0] int_reg_addr_neg;

	ay_model_latch
	#(
		.WIDTH(4)
	)
	regaddr_latch
	(
		.load ( da_latch_wr),
		.store(_da_latch_wr),

		.d(~da[3:0]),
		. q(int_reg_addr_neg),
		._q(int_reg_addr_pos)
	);

	assign  d_latch_1 = ~( {4{rst_1}} | int_reg_addr_neg);
	assign _d_latch_1 = ~( {4{rst_1}} | int_reg_addr_pos);



	/* /INTERNAL_SEL */
	assign _internal_sel = ~(psg_sel | rst_1);



	/* SEL_R*, /SEL_R16, /SEL_R17 */
	assign  sel_r0 = ~(_internal_sel |  d_latch_1[3] |  d_latch_1[2] |  d_latch_1[1] |  d_latch_1[0]);
	assign  sel_r1 = ~(_internal_sel |  d_latch_1[3] |  d_latch_1[2] |  d_latch_1[1] | _d_latch_1[0]);
	assign  sel_r2 = ~(_internal_sel |  d_latch_1[3] |  d_latch_1[2] | _d_latch_1[1] |  d_latch_1[0]);
	assign  sel_r3 = ~(_internal_sel |  d_latch_1[3] |  d_latch_1[2] | _d_latch_1[1] | _d_latch_1[0]);
	assign  sel_r4 = ~(_internal_sel |  d_latch_1[3] | _d_latch_1[2] |  d_latch_1[1] |  d_latch_1[0]);
	assign  sel_r5 = ~(_internal_sel |  d_latch_1[3] | _d_latch_1[2] |  d_latch_1[1] | _d_latch_1[0]);
	assign  sel_r6 = ~(_internal_sel |  d_latch_1[3] | _d_latch_1[2] | _d_latch_1[1] |  d_latch_1[0]);
	assign  sel_r7 = ~(_internal_sel |  d_latch_1[3] | _d_latch_1[2] | _d_latch_1[1] | _d_latch_1[0]);
	assign sel_r10 = ~(_internal_sel | _d_latch_1[3] |  d_latch_1[2] |  d_latch_1[1] |  d_latch_1[0]);
	assign sel_r11 = ~(_internal_sel | _d_latch_1[3] |  d_latch_1[2] |  d_latch_1[1] | _d_latch_1[0]);
	assign sel_r12 = ~(_internal_sel | _d_latch_1[3] |  d_latch_1[2] | _d_latch_1[1] |  d_latch_1[0]);
	assign sel_r13 = ~(_internal_sel | _d_latch_1[3] |  d_latch_1[2] | _d_latch_1[1] | _d_latch_1[0]);
	assign sel_r14 = ~(_internal_sel | _d_latch_1[3] | _d_latch_1[2] |  d_latch_1[1] |  d_latch_1[0]);
	assign sel_r15 = ~(_internal_sel | _d_latch_1[3] | _d_latch_1[2] |  d_latch_1[1] | _d_latch_1[0]);

	assign _sel_r16 = (_internal_sel | _d_latch_1[3] | _d_latch_1[2] | _d_latch_1[1] |  d_latch_1[0]);
	assign _sel_r17 = (_internal_sel | _d_latch_1[3] | _d_latch_1[2] | _d_latch_1[1] | _d_latch_1[0]);



	/* B7..B0 <> DA7..DA0 */
	assign b = _psg_sel ? 8'd0 : (_reg_wr ? 8'bZ : da);

	assign da = _da_out_en ? 8'bZ : b; 



	/* R7_B0..7 */
	ay_model_rw_latch reg7
	(
		.gate (sel_r7),
		.write(reg_wr),
		.store(_reg_wr),

		.d(b),

		. q(r7_b),
		._q()
	);


	/* noise period */
	ay_model_rw_latch #( .WIDTH(5) ) reg6
	(
		.gate (sel_r6),
		.write(reg_wr_2),
		.store(_reg_wr),

		.d(b[4:0]),

		. q( noise_period),
		._q(_noise_period)
	);

	/* envelope period */
	ay_model_rw_latch reg13
	(
		.gate (sel_r13),
		.write(reg_wr),
		.store(_reg_wr),

		.d(b),

		. q( env_period[7:0]),
		._q(_env_period[7:0])
	);
	ay_model_rw_latch reg14
	(
		.gate (sel_r14),
		.write(reg_wr),
		.store(_reg_wr),

		.d(b),

		. q( env_period[15:8]),
		._q(_env_period[15:8])
	);

	/* envelope mode */
	ay_model_rw_latch #( .WIDTH(4) ) reg15
	(
		.gate (sel_r15),
		.write(reg_wr),
		.store(_reg_wr),

		.d(b[3:0]),

		. q(env_mode),
		._q()
	);



	/* GPIO */
	assign _r7_b6_1 = ~r7_b[6];
	assign _r7_b7_1 = ~r7_b[7];

	assign wr_r16_1 = ~(_sel_r16 | _reg_wr);
	assign wr_r17_1 = ~(_sel_r17 | _reg_wr);

	assign _en_r16_rd = _sel_r16 | reg_wr;
	assign _en_r17_rd = _sel_r17 | reg_wr;

	ay_model_gpio ioa_block
	(
		.b (b  ),
		.io(ioa),

		._reg_wr   (_reg_wr   ),
		.wr_reg_1  (wr_r16_1  ),
		._r7_b_1   (_r7_b6_1  ),
		._en_reg_rd(_en_r16_rd)
	);

	ay_model_gpio iob_block
	(
		.b (b  ),
		.io(iob),

		._reg_wr   (_reg_wr   ),
		.wr_reg_1  (wr_r17_1  ),
		._r7_b_1   (_r7_b7_1  ),
		._en_reg_rd(_en_r17_rd)
	);



	/* AY channels */
	ay_model_channel channel_a
	(
		. f1    ( f1),
		._f1    (_f1),
		.cnt_clk(cnt_clk),
		
		.rst_1(rst_1),
		
		. reg_wr( reg_wr),
		._reg_wr(_reg_wr),
		.sel_tone_lo(sel_r0),
		.sel_tone_hi(sel_r1),
		.sel_vol    (sel_r10),
		
		.b(b),

		._noise_en(r7_b[3]),
		._tone_en (r7_b[0]),

		.e    (e    ),
		.noise(noise),

		.sound(ch_a)
	);

	ay_model_channel channel_b
	(
		. f1    ( f1),
		._f1    (_f1),
		.cnt_clk(cnt_clk),
		
		.rst_1(rst_1),
		
		. reg_wr( reg_wr),
		._reg_wr(_reg_wr),
		.sel_tone_lo(sel_r2),
		.sel_tone_hi(sel_r3),
		.sel_vol    (sel_r11),
		
		.b(b),

		._noise_en(r7_b[4]),
		._tone_en (r7_b[1]),

		.e    (e    ),
		.noise(noise),

		.sound(ch_b)
	);

	ay_model_channel channel_c
	(
		. f1    ( f1),
		._f1    (_f1),
		.cnt_clk(cnt_clk),
		
		.rst_1(rst_1),
		
		. reg_wr( reg_wr),
		._reg_wr(_reg_wr),
		.sel_tone_lo(sel_r4),
		.sel_tone_hi(sel_r5),
		.sel_vol    (sel_r12),
		
		.b(b),

		._noise_en(r7_b[5]),
		._tone_en (r7_b[2]),

		.e    (e    ),
		.noise(noise),

		.sound(ch_c)
	);



	/* noise generation */
	ay_model_rs_ff noise_clk_conditioning
	(
		.reset(_f1),
		.  set(rst_1 | (cnt_clk & noise_carry_out)),

		. q(noise_latch_up_phase),
		._q(noise_latch_dn_phase)
	);
	//
	ay_model_clk_ff noise_shift_clk_gen
	(
		.up_phase(noise_latch_up_phase),
		.dn_phase(noise_latch_dn_phase),
		.set(1'b0),
		.rst(rst_1),

		.q_up(pre_f4),
		.q_dn()
	);
	//
	ay_model_rs_ff noise_shift_clk_cond
	(
		.reset( pre_f4),
		.  set(~pre_f4),
		. q(_f4),
		._q( f4)
	);
	//
	ay_model_counter #( .WIDTH(5) ) noise_counter
	(
		. f1( f1),
		._f1(_f1),
		.rst(noise_latch_up_phase),

		. period( noise_period),
		._period(_noise_period),

		.carry_out(noise_carry_out)
	);
	// noise LFSR
	ay_model_shiftreg noise_shift_reg
	(
		._f(_f4),
		. f( f4),

		.rst(rst_1),

		.shift_in( (noise_reg[16] ^ noise_reg[13]) | (~|noise_reg) ),

		.result( noise_reg )
	);
	//
	assign noise = ~noise_reg[16];





	// envelope generation
	assign env_rst = reg_wr & sel_r15;
	//


	// clock conditioning flipflop
	ay_model_rs_ff env_cntr_clk_conditioning
	(
		.reset(_f1),
		.  set(env_rst | (cnt_clk & env_carry_out)),

		. q(env_phase_up),
		._q(env_phase_dn)
	);

	// env freq output latch
	ay_model_clk_ff env_output
	(
		.up_phase(env_phase_up),
		.dn_phase(env_phase_dn),
		.set(1'b0),
		.rst(env_rst),

		.q_up(),
		.q_dn(f_env)
	);
	//
	assign ep_rst = ~env_phase_dn;
	//
	ay_model_counter #( .WIDTH(16) ) env_counter
	(
		. f1( f1),
		._f1(_f1),
		.rst(ep_rst),

		. period( env_period),
		._period(_env_period),

		.carry_out(env_carry_out)
	);




	// envelope state machine

	wire pre_clk;
	//
	assign pre_clk = ~(f_env_dis | f_env);
	//
	ay_model_rs_ff env_st_clk_conditioning
	(
		.reset(~(env_rst | pre_clk)),
		.  set(  env_rst | pre_clk ),

		. q(env_clk_up),
		._q(env_clk_dn)
	);

	// e_mx FFs
	wire [3:0]  emx;
	wire [3:0] _emx;
	//
	ay_model_clk_ff e0_mx
	(
		.up_phase(env_clk_up),
		.dn_phase(env_clk_dn),
		.set(f_env_dis),
		.rst(env_rst),

		.q_up( emx[0]),
		.q_dn(_emx[0])
	);
	ay_model_clk_ff e1_mx
	(
		.up_phase( emx[0]),
		.dn_phase(_emx[0]),
		.set(f_env_dis),
		.rst(env_rst),

		.q_up( emx[1]),
		.q_dn(_emx[1])
	);
	ay_model_clk_ff e2_mx
	(
		.up_phase( emx[1]),
		.dn_phase(_emx[1]),
		.set(f_env_dis),
		.rst(env_rst),

		.q_up( emx[2]),
		.q_dn(_emx[2])
	);
	ay_model_clk_ff e3_mx
	(
		.up_phase( emx[2]),
		.dn_phase(_emx[2]),
		.set(f_env_dis),
		.rst(env_rst),

		.q_up( emx[3]),
		.q_dn(_emx[3])
	);


	// decay/attack
	wire da_up, da_dn;
	wire pre_selea;
	//
	ay_model_clk_ff env_decay_attack
	(
		.up_phase( emx[3] & env_mode[1]),
		.dn_phase(_emx[3]),
		.set(1'b0),
		.rst(env_rst),

		.q_up(da_up),
		.q_dn(da_dn)
	);
	//
	assign pre_selea = env_mode[2] ? da_dn : da_up;
	//
	ay_model_rs_ff sel_ea_ff
	(
		.reset(~pre_selea),
		.  set( pre_selea),

		. q(_sel_ea),
		._q( sel_ea)
	);


	// hold
	ay_model_clk_ff env_hold
	(
		.up_phase( emx[3] & env_mode[0]),
		.dn_phase(_emx[3]),
		.set(1'b0),
		.rst(env_rst),

		.q_up(),
		.q_dn(f_env_dis)
	);


	// continue
	wire cont_up_phase;
	wire cont_q_up;
	//
	ay_model_clk_ff env_cont
	(
		.up_phase(cont_up_phase),
		.dn_phase(_emx[3]),
		.set(1'b0),
		.rst(env_rst),

		.q_up(cont_q_up),
		.q_dn()
	);
	//
	assign _env_en = ~(cont_q_up | env_mode[3]);
	//
	assign #0.01 cont_up_phase = ~(_env_en | (~emx[3]));




	// e_mx 
	assign e_mx = sel_ea ? emx : _emx;

	// final envelope level
	assign e = ~(e_mx | {4{_env_en}});
	
	
	
	// test_1 pin
	assign test_1 = f_env;

endmodule








module ay_model_channel // one of three identical AY channels
(
	input  wire  f1,     //
	input  wire _f1,     // clock phases
	input  wire cnt_clk, //
	
	input  wire rst_1, // reset
	
	
	input  wire  reg_wr, // common write/store strobes
	input  wire _reg_wr,

	input  wire sel_tone_lo, // select for tone low register
	input  wire sel_tone_hi, // tone high

	input  wire sel_vol, // volume register

	
	inout  wire [7:0] b, // internal AY bidir bus


	input  wire       _noise_en, // from mixer register
	input  wire       _tone_en,  //

	input  wire [3:0] e, // from envelope generator

	input  wire       noise, // from noise generator


	output wire [3:0] sound // output data, 0 -- cutoff, 1..15 -- corresponding DAC values
);
	wire [3:0] volume;
	wire       env_ena;

	wire [11:0]  period;
	wire [11:0] _period;

	wire tone;
	wire snd;



	/* volume latch */
	ay_model_rw_latch #( .WIDTH(4) ) volume_reg
	(
		.gate (sel_vol),
		.write( reg_wr),
		.store(_reg_wr),

		.d(b[3:0]),
		. q(volume),
		._q()
	);

	/* env enable latch */
	ay_model_rw_latch #( .WIDTH(1) ) env_reg
	(
		.gate (sel_vol),
		.write( reg_wr),
		.store(_reg_wr),

		.d(b[4]),
		. q(env_ena),
		._q()
	);

	/* period low latch */
	ay_model_rw_latch #( .WIDTH(8) ) period_low_reg
	(
		.gate (sel_tone_lo),
		.write( reg_wr),
		.store(_reg_wr),

		.d(b),
		. q( period[7:0]),
		._q(_period[7:0])
	);

	/* period high latch */
	ay_model_rw_latch #( .WIDTH(4) ) period_high_reg
	(
		.gate (sel_tone_hi),
		.write( reg_wr),
		.store(_reg_wr),

		.d(b[3:0]),
		. q( period[11:8]),
		._q(_period[11:8])
	);



	/* SND_* signal */
	wire int_noise_gated;
	wire int_tone_gated;

	assign int_noise_gated = ~(noise | _noise_en);
	
	assign int_tone_gated = ~(tone | _tone_en);

	assign snd = ~(int_noise_gated | int_tone_gated);



	/* DAC output */
	wire [3:0] int_volume;
	wire [3:0] int_volume_n;
	wire int_snd_n;

	assign int_volume = env_ena ? e : volume;
	
	assign int_volume_n = ~int_volume;

	assign int_snd_n = ~snd;

	assign sound = ~(int_volume_n | {4{int_snd_n}});



	/* period counter */
	wire carry_out;

	wire tone_latch_up_phase;
	wire tone_latch_dn_phase;

	wire counter_rst;



	// clock conditioning flipflop
	ay_model_rs_ff clk_conditioning
	(
		.reset(_f1),
		.  set(rst_1 | (cnt_clk & carry_out)),

		. q(tone_latch_up_phase),
		._q(tone_latch_dn_phase)
	);

	// tone output latch
	ay_model_clk_ff tone_output
	(
		.up_phase(tone_latch_up_phase),
		.dn_phase(tone_latch_dn_phase),
		.set(1'b0),
		.rst(rst_1),

		.q_up(tone),
		.q_dn()
	);

	// period counter reset
	assign counter_rst = ~tone_latch_dn_phase;


	ay_model_counter #( .WIDTH(12) ) channel_counter
	(
		. f1( f1),
		._f1(_f1),
		.rst(counter_rst),

		. period( period),
		._period(_period),

		.carry_out(carry_out)
	);


endmodule






module ay_model_gpio // one of two identical AY gpio ports
(
	inout  wire [7:0] b,
	inout  tri1 [7:0] io,

	input  wire _reg_wr,
	input  wire wr_reg_1,
	input  wire _r7_b_1,
	input  wire _en_reg_rd
);
	wire [7:0] int_output;

	ay_model_latch out_latch
	(
		.d(b),
		.load(wr_reg_1),
		.store(_reg_wr),
		.q(int_output),
		._q()
	);

	assign io = _r7_b_1 ? 8'hZZ : int_output; // out data

	assign b = _en_reg_rd ? 8'hZZ : io; // in data

endmodule










module ay_model_rs_ff // RS-flipflop
(
	input  wire reset,
	input  wire   set,

	output reg  q,
	output reg _q
);
	always @*
		 q <= #0.01 ~(_q | reset);
	                  
	always @*
		_q <= #0.01 ~( q |   set);
endmodule



module ay_model_clk_ff // clock flipflop
#(
	parameter UP_RST = 1
)
(
	input  wire up_phase, // upper (on schematics) phase
	input  wire dn_phase, // lower (on schematics) phase
	input  wire set, // upper gate clear signal
	input  wire rst,

	output reg  q_up, // upper and lower (on schematics) outputs
	output reg  q_dn  //
);
	trireg up_store; // modelled passgates that feed NAND inputs of main gates
	trireg dn_store; //

	wire int_up_rst;

	assign int_up_rst = UP_RST ? rst : 1'b0;

	assign up_store = int_up_rst ? 1'b0 : ( dn_phase ? q_up : 1'bZ );

	assign dn_store = dn_phase ? q_dn : 1'bZ;

	always @*
		q_up <= #0.01 (~q_dn) & (~set) & (~(up_phase & up_store)) & (~(int_up_rst & dn_phase));
	
	always @*
		q_dn <= #0.01 (~q_up) & (~rst) & (~(dn_store & up_phase));
endmodule





module ay_model_latch // 2-phase latch
#(
	parameter WIDTH=8
)
(
	input  wire load,  // when 1, latch is transparent
	input  wire store, // when 1, latch stores its last value

	input  wire [WIDTH-1:0] d,
	output wire [WIDTH-1:0]  q,
	output wire [WIDTH-1:0] _q
);

	trireg [WIDTH-1:0] inwire;


	assign inwire = load  ? d : {WIDTH{1'bZ}};
	assign inwire = store ? q : {WIDTH{1'bZ}};

	assign _q = ~inwire;
	assign  q = ~_q;

endmodule



module ay_model_rw_latch // readable and writable latch
#(
	parameter WIDTH=8
)
(
	input  wire gate,  // input gating
	input  wire write, // write strobe (REG_WR on schematics)
	input  wire store, // store strobe (/REG_WR on schematics)

	inout  wire [WIDTH-1:0] d,
	output reg  [WIDTH-1:0]  q,
	output wire [WIDTH-1:0] _q
);
	wire d_oe;

	assign d = d_oe ? q : {WIDTH{1'bZ}};
	assign d_oe = store & gate;

	assign _q = ~q;

	
	always @*
	if( gate && write )
		q <= d;

endmodule



module ay_model_counter // async resettable counter with a comparator
#(
	parameter WIDTH=0
)
(
	input  wire  f1,
	input  wire _f1, // clocking phases

	input  wire rst, // async reset

	input  wire [WIDTH-1:0]  period,
	input  wire [WIDTH-1:0] _period, // inverse copy of period

	output wire carry_out // 1 when counter value is greater than period
);

	wire [WIDTH-1:0] cnt_up;
	wire [WIDTH-1:0] cnt_dn;

	wire [WIDTH-1: 0] i;
	wire [WIDTH-1:-1] c;

	genvar g;



	// first flipflop
	ay_model_clk_ff #( .UP_RST(0) ) counter_bit_0
	(
		.up_phase(_f1),
		.dn_phase( f1),
		.set(1'b0),
		.rst(rst),

		.q_up(cnt_up[0]),
		.q_dn(cnt_dn[0])
		
	);
	// remaining flipflops
	generate begin
		for(g=1;g<WIDTH;g=g+1)
		begin : counter_bits

			ay_model_clk_ff counter_bit
			(
				.up_phase(cnt_up[g-1]),
				.dn_phase(cnt_dn[g-1]),
				.set(1'b0),
				.rst(rst),

				.q_up(cnt_up[g]),
				.q_dn(cnt_dn[g])
			);
		end
	end endgenerate


	// carry propagation (carry_out=1 when counter>=period)
	assign c[-1]=1'b1;

	assign i[WIDTH-1:0] = ~( c[WIDTH-2:-1] | (cnt_dn & _period));
	assign c[WIDTH-1:0] = ~( i             | (cnt_up &  period));

	assign carry_out = c[WIDTH-1];




endmodule



module ay_model_shiftreg
#(
	parameter WIDTH=17
)
(
	input  wire _f,
	input  wire  f,
	input  wire rst,

	input  wire shift_in,
	output wire [WIDTH-1:0] result
);

	wire [WIDTH-1:0] shin;

	trireg [WIDTH-1:0] l1;
	trireg [WIDTH-1:0] l2;


	// shift in
	assign shin = { l2[WIDTH-2:0], shift_in };

	assign l1 = rst ? {WIDTH{1'b0}} : (_f ? shin : {WIDTH{1'bZ}});

	assign l2 = f ? l1 : {WIDTH{1'bZ}};

	assign result = l2;

endmodule

