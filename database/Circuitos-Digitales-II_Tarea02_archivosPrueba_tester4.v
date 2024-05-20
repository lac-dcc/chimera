// This program was cloned from: https://github.com/jrpompio/Circuitos-Digitales-II
// License: MIT License

`timescale 100 ms / 10 ms  // time-unit = 1 s , precision = 10 p

module test (
    output reg clk,
    output reg sensorA,
    output reg sensorB,
    output reg [7:0] pass,
    input wire gateState,
    input wire blockAlarm,
    input wire wrongPinAlarm
);

    always
    begin
        #1 clk=!clk;               // Semiciclo = 100 ms
    end

    initial
               begin
        clk = 0;                   // Valor incial del clock
        $dumpfile("ondas.vcd");         
        $dumpvars;
        #0.001                     // Los valores anteriores se mantienen
                                   // Por 1 ms

            
            sensorA = 1'b1;        // llega el vehiculo, sensor A en alto 
            sensorB = 1'b1;        // hay otro adentro, sensor B en alto
            pass = 8'b00000000;    // La contraseña es incorrecta
        #50                         // Se debe agregar esto para pasar
                                   // Al siguiente estado


            sensorA = 1'b0;        // no hay nada, sensor A en bajo 
            sensorB = 1'b1;        // hay otro adentro, sensor B en alto
            pass = 8'b00100110;    // La contraseña ahora es correcta
        #20                       // Esto se mantiene por 10 segundos
        
            sensorA = 1'b0;        // no hay nada, sensor A en bajo 
            sensorB = 1'b1;        // hay otro adentro, sensor B en alto
            pass = 0;             // quita la contraseña
        #80                       // Esto se mantiene por 10 segundos
    



         
        #10        
            $finish;
end

endmodule

