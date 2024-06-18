// This program was cloned from: https://github.com/RCoeurjoly/tt06-simplez
// License: Apache License 2.0

//-------------------------------------------------------------------
//-- microbio_tb
//-- Banco de pruebas para el microprocesador MICROBIO
//-------------------------------------------------------------------
//-- BQ November 2015. Written by Juan Gonzalez (Obijuan)
//-------------------------------------------------------------------
`default_nettype none

module simplez_tb();

//-- Programa en codigo maquina a cargar en la rom
parameter ROMFILE = "prog.list";

//-- Para la simulacion se usa un WAIT_DELAY de 3 ciclos de reloj
parameter WAIT_DELAY = 20;

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Datos de salida del componente
wire [7:0] leds;
wire stop;
reg rstn = 0;
wire tx;

//-- Instanciar el componente
simplez #(.ROMFILE(ROMFILE), .WAIT_DELAY(WAIT_DELAY))
  dut(
    .clk(clk),
    .rstn_ini(rstn),
    .leds(leds),
    .stop(stop),
    .tx(tx)
  );

//-- Generador de reloj. Periodo 2 unidades
always #1 clk = ~clk;


//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("simplez_tb.vcd");
  $dumpvars(0, simplez_tb);

  #2 rstn <= 1;

  # 160 $display("FIN de la simulacion");
  $finish;
end

endmodule
