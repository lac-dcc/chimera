// This program was cloned from: https://github.com/jferrer08/latinpractice
// License: Apache License 2.0

`timescale 1ns/1ns
`include "topTDC.v"
`include "contadorTDC.v"
`include "RS232_TX.v"

module topTDC_tb;

   // Parámetros
    parameter PERIOD = 20;

    // Señales del test bench
    reg clk, reset, stop;
    wire tx, eot;

    // Instancia del contador a probar
    topTDC c1 (.clk(clk), .reset(reset), .stop(stop), .tx(tx), .eot(eot));

    // Generación del reloj
    always 
	#((PERIOD)/2) clk = ~clk;

    // Proceso para verificar el contador
    initial begin
        //almacenamiento de datos
        $dumpfile("topTDC_tb.vcd");
        $dumpvars(0, topTDC_tb);

        //visulizacion de datos
        $monitor("Tiempo = %d, Valor = %d (%h)", $time, tx, eot);

        // Reset inicial
        clk =1;
        reset = 1;
        //stop = 0;
        #20;
        
        // Esperar algunos ciclos de reloj para verificar el contador
        reset = 0;
        stop = 1;
        #20;

        // Finalizar simulación
        //reset = 1;
        stop = 1;
        #380;

        //reset = 1;
        stop = 0;
        //#20;

        //reset = 0;
        //stop = 1;
        #100;

        reset = 1;
        #20;

        reset = 0;
        stop = 1;
        #580;

        stop = 0;
        #100;

        $display("Finalizado");
        $finish;
    end


endmodule