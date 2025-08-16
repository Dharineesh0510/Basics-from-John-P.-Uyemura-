// logic_circuit_tb.v
`timescale 1ns / 1ps

module testbench;
   reg a, b, c, d;
   wire F1, F2;

   // CORRECTED: The module name now matches the definition exactly.
   LogicCircuit dut (
       .a(a),
       .b(b),
       .c(c),
       .d(d),
       .F1(F1),
       .F2(F2)
   );

   initial begin
      $dumpfile("Waveform.vcd");
      $dumpvars(0, testbench);

      $display("Time | a b c d | F1 F2");
      $monitor("%4t | %b %b %b %b | %b  %b", $time, a, b, c, d, F1, F2);

      // Your test vectors are fine
      a = 0; b = 0; c = 0; d = 0; #10;
      a = 0; b = 0; c = 0; d = 1; #10; // This line was missing in your testbench
      a = 0; b = 0; c = 1; d = 0; #10;
      a = 0; b = 0; c = 1; d = 1; #10;
      a = 0; b = 1; c = 0; d = 0; #10;
      a = 0; b = 1; c = 0; d = 1; #10;
      a = 0; b = 1; c = 1; d = 0; #10;
      a = 0; b = 1; c = 1; d = 1; #10;
      a = 1; b = 0; c = 0; d = 0; #10;
      a = 1; b = 0; c = 0; d = 1; #10;
      a = 1; b = 0; c = 1; d = 0; #10;
      a = 1; b = 0; c = 1; d = 1; #10;
      a = 1; b = 1; c = 0; d = 0; #10;
      a = 1; b = 1; c = 0; d = 1; #10;
      a = 1; b = 1; c = 1; d = 0; #50;
      a = 1; b = 1; c = 1; d = 1; #50;

      $finish;
   end
endmodule
