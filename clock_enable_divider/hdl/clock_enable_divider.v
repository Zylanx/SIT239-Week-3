`timescale 1ns/1ns

module clock_enable_divider
	(
		input i_clk,
		input i_clken,
		
		output reg o_clk_en_half = 1'b0,
		output reg o_clk_en_quarter = 1'b0
	);

	// Counter that is incremented each clock cycle
	// Used in comparisons to drive the divided outputs
	reg [4:0] r_clk_counter = 5'b00;
	
	// Clock counter incrementer.
	// Each clock cycle will increment the clock counter by 1
	always @(posedge i_clk)
	begin
		if (i_clken)
		begin
			r_clk_counter <= r_clk_counter + 5'd1;
		end
	end

	// Comparison block.
	// Compare bits of the counter to know when to drive outputs
	always @(posedge i_clk)
	begin
		// Default values
		o_clk_en_half <= 1'b0;
		o_clk_en_quarter <= 1'b0;
		
		if (i_clken)
		begin
			if (r_clk_counter % 8 == 1'd0)
			begin
				o_clk_en_half <= 1'b1;
			end
			
			if (r_clk_counter % 32 == 1'd0)
			begin
				o_clk_en_quarter <= 1'b1;
			end
		end
	end
endmodule