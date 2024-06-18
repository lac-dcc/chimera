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
            sensorB = 1'b0;        // llega el vehiculo, sensor B en bajo 
            pass = 8'b10100110;    // Clave incorrecta
        #2                         // Se debe agregar esto para pasar
                                   // Al siguiente estado


            sensorA = 1'b1;        // Sensor A sigue en alto 
            sensorB = 1'b0;        // Sensor B sigue en bajo
            pass = 8'b10100110;    // Clave incorrecta
        #100                        // Estos valores se mantienen por 10000 ms
                                   // Es decir por 10 segundos que también 
                                   // quivalen a 50 ciclos de reloj



            sensorA = 1'b1;        // el auto se va, sensor A en bajo
            sensorB = 1'b0;        // no hay auto dentro, sensor B en alto
            pass = 8'b00100110;    // La contraseña ahora es correcta
        #100                       // Esto se mantiene por 10 segundos
    



            sensorB = 1'b1;        // El auto termina de entrar, sensor b en
                                   // en alto
            sensorA = 1'b0;        // El auto no está en la entrada, sensor A
                                   // En bajo
        #100                       // Esto se mantiene por 10 segundos de reloj
        
            $finish;
    end

endmodule

