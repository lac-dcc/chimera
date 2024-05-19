// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Interface control

module ifctl(
	input clk_sys,
	input clo,
	input gotst1,
	input zgi_j,
	input zgi_set,
	input ifhold_j,
	input ifhold_reset,
	input zw,
	input ren,
	input rok,
	output reg ok$,
	output zg,
	output zwzg,
	output talarm
);

	parameter ALARM_DLY_TICKS;
	parameter ALARM_TICKS;

	// Cała obsługa interfejsu potencjalnie też powinna być zrobiona jako automat.
	// Być może powinna znaleźć się (po części?) w strobgen - oczekiwanie na interfejs między
	// GOT a S1 jest niczym innym jak kolejnym stanem.

	wire oken = ren | rok;
	assign zwzg = zgi & zw;
	assign zg = zgi | ifhold | (zw & oken);
	// (zw & oken): trzymamy zg aż nie spadnie ok|en
	// ifhold: trzymamy zajęty interfejs przez cały rozkaz z wymogiem atomowych odwołań do pamięci

	// * wejście do zgi_set zaczyna zgłoszenie
	// * każdy kolejny strob1 kończy zgłoszenie
	// * każdy kolejny got zaczyna następne zgłoszenie
	// * zgi_j mówi w jakich stanach zgłaszanie się odbywa

	reg zgi;
	always @ (posedge clk_sys, posedge clo) begin
		if (clo) zgi <= 1'b0;
		else if (zgi_set) zgi <= 1'b1;
		else if (gotst1) case (zgi_j)
			1'b0: zgi <= 1'b0;
			1'b1: zgi <= ~zgi;
		endcase
	end

	// ten rejestr trzyma zgłoszenie na interfejsie dla rozkazów, które robią
	// odczyt+zapis, który powinien być zrobiony w tym samym dostępie do I/F (atomowo)
	// (ifhold wypełnia sygnał ZW pomiędzy stanami WR a WW)
	// Przypadek specjalny:
	// IS dokonuje zapisu do pamięci warunkowo względem wskaźnika zera WZI,
	// więc jeśli w W& przy rozkazie IS podczas STROB2 WZI będzie zapalone, to zdejmujemy zajętość (ifhold_reset)

	reg ifhold;
	wire ifh_reset = ifhold_reset | clo;
	always @ (posedge clk_sys, posedge ifh_reset) begin
		if (ifh_reset) ifhold <= 1'b0;
		else if (ok$) case ({ifhold_j, ifhold})
			2'b00: ifhold <= ifhold;
			2'b01: ifhold <= 1'b0;
			2'b10: ifhold <= 1'b1;
			2'b11: ifhold <= ~ifhold;
		endcase
	end

	// ok$ - koniec pracy z interfejsem (niezależnie od finału: ok/en/alarm)
	wire ok_clk = ren | talarm | rok;
	always @ (posedge clk_sys, negedge zgi) begin
		if (!zgi) ok$ <= 0;
		else ok$ <= zwzg & ok_clk;
	end

	// alarm przy braku odpowiedzi z interfejsu

	wire alarm = zwzg & ~ok$;
	alarm #(
		.ALARM_DLY_TICKS(ALARM_DLY_TICKS),
		.ALARM_TICKS(ALARM_TICKS)
	) ALARM(
		.clk_sys(clk_sys),
		.engage(alarm),
		.talarm(talarm)
	);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
