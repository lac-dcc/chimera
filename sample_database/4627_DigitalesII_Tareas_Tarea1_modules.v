// This program was cloned from: https://github.com/menesesj6/DigitalesII
// License: MIT License

/* 
Modulos para controlador automatizado de compuerta

Hecho por: Jorge Meneses Garro
Fecha de entrega: 13 de Abril de 2024
*/

// Modulo de verificacion de contrasena
module passwordVer(
    password,
    arrivalSensor, 
    alarm, 
    validity,
    enter
    ); 

// Net de 8 bits para la contrasena
input wire [7:0] password; 

// Definicion de inputs y outputs
input arrivalSensor, enter;
output alarm,  validity;

wire arrivalSensor, enter;
reg alarm, validity;

// Contrasena esperada, carne: C14742
parameter rightPass = 8'b00101010; // O bien, 0x2A

integer counter = 0; // Contador para saber cuantos fallos se han tenido

always @(*) begin
    // Condicion inicial
    if (arrivalSensor == 0 && password == 8'b00000000)begin
        validity = 0;
        alarm = 0;
    // Sin importar la contrasena, se pone todo en cero si no hay carro
    end else if (arrivalSensor == 0) begin
        validity = 0;
        alarm = 0;
    end else if (arrivalSensor == 1 && enter == 1)begin 
        if (password == rightPass) begin
            validity = 1; // Se envia que todo bien al controlador de la compuerta
            alarm = 0; // NO se activa la alarma de pin incorrecto
            counter = 0; // Se reinicia el contador
        end else if (password != rightPass && enter == 1) begin // Conrasena distinta
            validity = 0;
            counter += 1; // Si se falla, sumar un intento fallido al contador
        end 
    end

    // COntrasena correcta siempre activa, incluso sin sensor de llegada
    if (password == rightPass) begin
        validity = 1;
        alarm = 0;
        counter = 0;
    end

    // Activar alarma de pin incorrecto mas de 3 veces
    if (counter >= 3) begin
        validity = 0; // Senal en bajo al controlador de la compuerta
        alarm = 1; // Activa la alarma
    end 
end
endmodule

////////////////////////////////////////////////////////////////////////

// MOdulo de contorl de la compuerta
module gateController(
    arrival_Sensor,
    enterSensor,
    passValid,
    gateOpen,
    gateClose, 
    block, 
    blockAlarm
    );

// Definicion de inputs y outputs con su tipo
input arrival_Sensor, enterSensor, passValid;
output gateOpen, gateClose, block, blockAlarm;

wire arrival_Sensor, enterSensor, passValid;
reg gateOpen, gateClose, block, blockAlarm;

// Valores iniciales de las salidas
initial begin
    gateClose = 1;
    gateOpen = 0;
    block = 0;
    blockAlarm = 0;
end

always @(*) begin
    // Cuando la contrasena fue correcta
    if(passValid == 1) begin
        block = 0;
        blockAlarm = 0;
        if(enterSensor == 1 && arrival_Sensor == 1) begin
            gateClose = 0;
            gateOpen = 0;
            block = 1;
            blockAlarm = 1;
        end else if(enterSensor == 0 && arrival_Sensor == 0) begin
            gateOpen = gateOpen;
            gateClose = gateClose;
            block = 0;
            blockAlarm = 0;
        end else if(enterSensor == 1 && arrival_Sensor == 0) begin
            gateClose = 1;
            gateOpen = 0;
            block = 0;
            blockAlarm = 0;
        end else if(enterSensor == 0 && arrival_Sensor == 1)begin
            gateClose = 0;
            gateOpen = 1;
            block = 0;
            blockAlarm = 0;
        end
    
    // CUando la contrasena estaba mal
    end else if(passValid == 0) begin
        if (enterSensor == 0 && arrival_Sensor == 0 && block == 0)begin
            gateClose = gateClose;
            gateOpen = gateOpen;
            block = block;
            blockAlarm = blockAlarm;
        end  else if(enterSensor == 1 && arrival_Sensor == 1) begin
            gateClose = 0;
            gateOpen = 0;
            block = 1;
            blockAlarm = 1;
        end else if(enterSensor == 1 && arrival_Sensor == 0) begin
            gateClose = 1;
            gateOpen = 0;
            block = block;
            blockAlarm = blockAlarm;
        end 

    end

end
endmodule

////////////////////////////////////////////////////////////////////////

