`timescale 1ns/1ns

module tld_tb;
	// Inputs
	reg t_clk = 1'b0;
	reg [2:0] t_sliders = 3'b000;
	
	// Outputs
	wire [3:0] t_leds;
	
	// Instantiate the Unit Under Test (UUT)
	tld UUT (
		.i_clk(t_clk),
		.i_sliders(t_sliders),
		.o_leds(t_leds)
	);
	
	always #10 t_clk <= ~t_clk;

	initial begin
		$dumpfile("out.vcd");
		$dumpvars(2, tld_tb);
		
		t_sliders = 3'b000;
		#100
		
		t_sliders = 3'b111;
		#100
		
		t_sliders = 3'b001;
		#100
		
		t_sliders = 3'b010;
		#100
		
		t_sliders = 3'b100;
		#100
		
		t_sliders = 3'b011;
		#100
		
		t_sliders = 3'b110;
		#100
		
		t_sliders = 3'b101;
		#100
		
		t_sliders = 3'b000;
		#100
		
		#1000
		
		$stop;
	end

endmodule