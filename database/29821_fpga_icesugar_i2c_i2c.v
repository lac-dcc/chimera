// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module i2c (
    input           CLK,
    output          LED_R,
    output          LED_G,
    output          LED_B,
    output  [7:0]   LED,

    // I2C Bus 1 (Controller)
    inout       SDA1,
    output      SCL1,

    // I2C Bus 2 (Peripheral)
    inout       SDA2,
    input       SCL2
);

    i2c_controller c(
        .SDA(SDA1),
        .SCL(SCL1)
    );

    i2c_peripheral p(
        .SDA(SDA2),
        .SCL(SCL2),
        .LED(LED),
        .OK(LED_B)
    );

    assign LED_R = 0;
    assign LED_G = 1;
    //assign LED_B = 1;

endmodule
