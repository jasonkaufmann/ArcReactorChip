`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2023 01:39:17 PM
// Design Name: 
// Module Name: SoC_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SoC_tb ();
  reg CLK;
  reg RESET;
  wire [4:0] LEDS;
  wire RXD;
  wire TXD;
  parameter CLOCK_FREQ_CTRL = 4;

  SOC #(
      .CLOCK_DIVIDER(CLOCK_FREQ_CTRL)
  ) chip (
      .CLK  (CLK),
      .RESET(RESET),
      .LEDS (LEDS),
      .RXD  (RXD),
      .TXD  (TXD)
  );

  parameter CLOCK_PERIOD = 2;  // Clock period of 10 time units
  reg [31:0] MEM[0:255];  // Memory to hold the machine code
  `include "riscv_assembly.v"  // Include the RISC-V assembler
  integer i;
  integer file;

`ifdef BENCH
  localparam slow_bit = 13;
`else
  localparam slow_bit = 19;
`endif

  integer L0_ = 4;
  integer wait_ = 20;
  integer L1_ = 28;

  initial begin
    // Initialize reset
    RESET = 1'b0;

    //***********************************************************************//
    //* The following code is the RISC-V assembly code to be executed.      *//
    ADD(x10, x0, x0);
    Label(L0_);
    ADDI(x10, x10, 1);
    JAL(x1, LabelRef(wait_));  // call(wait_)
    JAL(zero, LabelRef(L0_));  // jump(l0_)

    EBREAK();

    Label(wait_);
    ADDI(x11, x0, 1);
    SLLI(x11, x11, slow_bit);
    Label(L1_);
    ADDI(x11, x11, -1);
    BNE(x11, x0, LabelRef(L1_));
    JALR(x0, x1, 0);

    endASM();
    //***********************************************************************//

    // Open or create a file named "memory.hex" for writing
    file = $fopen("program.hex", "w");

    // Iterate over the memory array and write each word in hexadecimal format
    for (i = 0; i < 256; i = i + 1) begin
      $fdisplay(file, "%h", MEM[i]);
    end

    // Close the file
    $fclose(file);
    #100;
    RESET = 1'b1;
    CLK   = 1'b0;  // Initial value of the clock
    // Generate clock with 50% duty cycle
    forever #(CLOCK_PERIOD / 2) CLK = ~CLK;
  end
endmodule

