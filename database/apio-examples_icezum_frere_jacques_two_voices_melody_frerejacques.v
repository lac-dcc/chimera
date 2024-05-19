// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

//--Fichero secnotas.v

//-- Incluir las constantes del modulo del divisor
`include "divider.vh"

//--Parametros

module secnotas(input wire clk, output reg ch_out, output reg ch_out2);

//--Notas a tocar
//--Definidas como parametros para las pruebas del testbench

parameter N0  = `DO_4;
parameter N1  = `RE_4;
parameter N2  = `MI_4;
parameter N3  = `FA_4;
parameter N4  = `SOL_4;
parameter N5  = `LA_4;
parameter N6  = `SI_4;
parameter N7  = `DO_5;


parameter DUR  = `T_500ms;

//--Cables de salida de los canales

wire ch0, ch1, ch2,ch3,ch4,ch5,ch6,ch7;

//--Seleccion del canal del multiplexor
reg [5:0] sel=0;
reg [5:0] sel2=60;//Un compas retrasado

//-Reloj de duracion de la nota
wire clk_dur;

//--Canal 0
divider #(N0)
  CH0(
    .clk_in(clk),
    .clk_out(ch0)
  );

  //-- Canal 1
divider #(N1)
  CH1 (
      .clk_in(clk),
      .clk_out(ch1)
    );

  //-- canal 2
divider #(N2)
  CH2 (
      .clk_in(clk),
      .clk_out(ch2)
    );

//-- canal 3
divider #(N3)
  CH3 (
    .clk_in(clk),
    .clk_out(ch3)
  );

  //-- canal 4
divider #(N4)
  CH4 (
      .clk_in(clk),
      .clk_out(ch4)
);

//-- canal 5
divider #(N5)
CH5 (
    .clk_in(clk),
    .clk_out(ch5)
);

//-- canal 6
divider #(N6)
CH6 (
    .clk_in(clk),
    .clk_out(ch6)
);

//-- canal 7
divider #(N7)
CH7 (
    .clk_in(clk),
    .clk_out(ch7)
);

//multiplexor de seleccion del canal de Salida

always @*
  case (sel)
    //Frere Jacques
    0 : ch_out<=ch0;
    1:ch_out<=ch1;
    2:ch_out<=ch2;
    3:ch_out<=ch0;

    4:ch_out<=0;

    //Frere Jacques
    5:ch_out<=ch0;
    6:ch_out<=ch1;
    7:ch_out<=ch2;
    8:ch_out<=ch0;

    9:ch_out<=0;

    //Dormez-vous?
    10:ch_out<=ch2;
    11:ch_out<=ch3;
    12:ch_out<=ch4;

    13:ch_out<=0;

    //Dormez-vous?
    14:ch_out<=ch2;
    15:ch_out<=ch3;
    16:ch_out<=ch4;

    17:ch_out<=0;

    //Sonnez les matines
    18:ch_out<=ch4;
    19:ch_out<=ch5;
    20:ch_out<=ch4;
    21:ch_out<=ch3;
    22:ch_out<=ch2;
    23:ch_out<=ch0;

    24:ch_out<=0;

    //Sonnez les matines
    25:ch_out<=ch4;
    26:ch_out<=ch5;
    27:ch_out<=ch4;
    28:ch_out<=ch3;
    29:ch_out<=ch2;
    30:ch_out<=ch0;

    31:ch_out<=0;

    //Din dan don
    32:ch_out<=ch0;
    33:ch_out<=ch4;
    34:ch_out<=ch0;

    35:ch_out<=0;

    //Din dan don
    36:ch_out<=ch0;
    37:ch_out<=ch4;
    38:ch_out<=ch0;

    39:ch_out<=0;


  default: ch_out<=0;
endcase

always @*
case (sel2)
  //Frere Jacques
  0 : ch_out2<=ch0;
  1:ch_out2<=ch1;
  2:ch_out2<=ch2;
  3:ch_out2<=ch0;

  4:ch_out2<=0;

  //Frere Jacques
  5:ch_out2<=ch0;
  6:ch_out2<=ch1;
  7:ch_out2<=ch2;
  8:ch_out2<=ch0;

  9:ch_out2<=0;

  //Dormez-vous?
  10:ch_out2<=ch2;
  11:ch_out2<=ch3;
  12:ch_out2<=ch4;

  13:ch_out2<=0;

  //Dormez-vous?
  14:ch_out2<=ch2;
  15:ch_out2<=ch3;
  16:ch_out2<=ch4;

  17:ch_out2<=0;

  //Sonnez les matines
  18:ch_out2<=ch4;
  19:ch_out2<=ch5;
  20:ch_out2<=ch4;
  21:ch_out2<=ch3;
  22:ch_out2<=ch2;
  23:ch_out2<=ch0;

  24:ch_out2<=0;

  //Sonnez les matines
  25:ch_out2<=ch4;
  26:ch_out2<=ch5;
  27:ch_out2<=ch4;
  28:ch_out2<=ch3;
  29:ch_out2<=ch2;
  30:ch_out2<=ch0;

  31:ch_out2<=0;

  //Din dan don
  32:ch_out2<=ch0;
  33:ch_out2<=ch4;
  34:ch_out2<=ch0;

  35:ch_out2<=0;

  //Din dan don
  36:ch_out2<=ch0;
  37:ch_out2<=ch4;
  38:ch_out2<=ch0;

  39:ch_out2<=0;


default: ch_out2<=0;
endcase

always @(posedge clk)  //-- Fix-me! Before: clk_dur
  begin
  sel<=sel+1;
  sel2<=sel2+1;
  end

divider #(DUR)
  TIMER0(
    .clk_in(clk),
    .clk_out(clk_dur)
    );

endmodule
