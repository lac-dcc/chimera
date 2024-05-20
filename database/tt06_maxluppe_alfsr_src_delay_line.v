// This program was cloned from: https://github.com/maxluppe/tt06_maxluppe_alfsr
// License: Apache License 2.0

module delay_line(
	line_in,	//Digitalization clock
	s0,			//LFSR Configurator clock
	s1,			//ALFSR reset
	s2,			//LFSR Configuratior output
	line_out	//LFSR Configurator reset
);

input wire	line_in;
input wire	s0;
input wire	s1;
input wire	s2;
output wire	line_out;

wire	nx101;
wire	nx102;
wire	nx103;
wire	nx104;
wire	nx105;
wire	nx106;
wire	nx107;
wire	nx108;
wire	nx109;
wire	nx110;
wire	nx111;
wire	nx112;
wire	nx113;

buf02	b2v_ix100(
	.A(line_in),
	.Y(nx101));
buf02	b2v_ix101(
	.A(nx101),
	.Y(nx102));
buf02	b2v_ix102(
	.A(nx102),
	.Y(nx103));
buf02	b2v_ix103(
	.A(nx103),
	.Y(nx104));
buf02	b2v_ix104(
	.A(nx104),
	.Y(nx105));
buf02	b2v_ix105(
	.A(nx105),
	.Y(nx106));
buf02	b2v_ix106(
	.A(nx106),
	.Y(nx107));
mux21	b2v_ix10(
	.A0(line_in),
	.A1(nx101),
	.S0(s0),
	.Y(nx108));
mux21	b2v_ix11(
	.A0(nx102),
	.A1(nx103),
	.S0(s0),
	.Y(nx109));
mux21	b2v_ix12(
	.A0(nx104),
	.A1(nx105),
	.S0(s0),
	.Y(nx110));
mux21	b2v_ix13(
	.A0(nx106),
	.A1(nx107),
	.S0(s0),
	.Y(nx111));
mux21	b2v_ix14(
	.A0(nx108),
	.A1(nx109),
	.S0(s1),
	.Y(nx112));
mux21	b2v_ix15(
	.A0(nx110),
	.A1(nx111),
	.S0(s1),
	.Y(nx113));
mux21_ni	b2v_ix16(
	.A0(nx112),
	.A1(nx113),
	.S0(s2),
	.Y(line_out));

endmodule
