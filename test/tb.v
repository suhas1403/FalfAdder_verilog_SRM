`default_nettype none
`timescale 1ns / 1ps

module tb;

  // Inputs and outputs
  reg  [7:0] ui_in;   // Dedicated inputs (can hold A, B, Cin for testing)
  wire [7:0] uo_out;  // Dedicated outputs (Sum, Cout)
  reg  [7:0] uio_in;  // IOs input path
  wire [7:0] uio_out; // IOs output path
  wire [7:0] uio_oe;  // IOs enable path
  reg        ena;     // enable
  reg        clk;     // clock
  reg        rst_n;   // active low reset

  // Instantiate the Full Adder design
  tt_um_suhas1403_full_adder dut (
      .ui_in(ui_in),
      .uo_out(uo_out),
      .uio_in(uio_in),
      .uio_out(uio_out),
      .uio_oe(uio_oe),
      .ena(ena),
      .clk(clk),
      .rst_n(rst_n)
  );

  // Clock generation: 100MHz
  initial begin
      clk = 0;
      forever #5 clk = ~clk;
  end

  // Optional: dump VCD for waveform viewing
  initial begin
      $dumpfile("tb_full_adder.vcd");
      $dumpvars(0, tb);
      #1;
  end

  // Test stimulus (example)
  initial begin
      rst_n = 0;
      ena   = 0;
      ui_in = 0;
      uio_in = 0;
      #20;
      
      rst_n = 1;
      ena   = 1;

      // Apply some test vectors to ui_in (A,B,Cin)
      ui_in = 8'b0000_0011; // Example: A=0, B=1, Cin=1
      #10;
      ui_in = 8'b0000_0101; // Example: A=0, B=1, Cin=0
      #10;
      ui_in = 8'b0000_1111; // Example: A=1, B=1, Cin=1
      #10;

      // End simulation
      #50;
      $finish;
  end

endmodule
