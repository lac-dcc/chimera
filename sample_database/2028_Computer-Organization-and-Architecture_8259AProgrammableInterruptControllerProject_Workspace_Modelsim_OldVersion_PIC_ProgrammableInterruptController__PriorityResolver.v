// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module PriorityResolver (
  input [7:0] valid_interrupts,  // Latch to store indices of valid interrupts
  output reg [2:0] serviced_interrupt_index  // Index of the interrupt to enter ISR
);

  int i = 0;
  reg [7:0] interrupt_indexes; // Register to store valid interrupt indexes

  always @* begin
    // Initialize serviced interrupt index
    serviced_interrupt_index = 3'b000;
    interrupt_indexes = valid_interrupts; // Store valid interrupts

    // Loop to find the lowest numbered peripheral with an interrupt
    for (i = 0; i < 8; i = i + 1) begin
      if (interrupt_indexes[i]) begin
        serviced_interrupt_index = i; // Assign lowest numbered peripheral with an interrupt
        i = 8; // Exit the loop once the interrupt is found
      end
    end
  end

endmodule
