// This program was cloned from: https://github.com/Obijuan/open-fpga-verilog-tutorial
// License: GNU General Public License v2.0

//-------------------------------------------------------------------
//-- echowire1_tb.v
//-- Banco de pruebas para el eco cableado del puerto serie y las 
//-- comprobaciones de las señales DTR y RTS
//-------------------------------------------------------------------
//-- BQ August 2015. Written by Juan Gonzalez (Obijuan)
//-------------------------------------------------------------------
//-- GPL License
//-------------------------------------------------------------------

module echowire1_tb();

//-- Declaracion de los cables
reg dtr = 0;
reg rts = 0;
reg rx = 0;
wire tx, led1, led2;

//-- Instanciar el componente
echowire1
  dut(
    .dtr(dtr),
    .rts(rts),
    .D1(led1),
    .D2(led2),
    .tx(tx),
    .rx(rx)
  );

//-- Generar cambios en dtr. Los mismos deben reflejarse en el cable D1
always
  #2 dtr <= ~dtr;

//-- Generar cambios en rts. Se deben reflejar en el cable D2
always
  #3 rts = ~rts;

//-- Generar cambios en rs. Se reflejan en TX
always
  #1 rx <= ~rx;

//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("echowire1_tb.vcd");
  $dumpvars(0, echowire1_tb);

  # 200 $display("FIN de la simulacion");
  $finish;
end

endmodule

