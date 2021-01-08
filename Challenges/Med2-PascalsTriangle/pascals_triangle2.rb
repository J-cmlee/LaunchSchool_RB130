#!/usr/bin/env ruby
# Copyright (c) 2016 Pete Hanson
# frozen_string_literal: true
# :reek:FeatureEnvy

class Triangle
  attr_reader :rows

  def initialize height
    @rows = (1..height).map { next_row }
  end

  private

  def next_row
    bottom_row = @previous_row ? [0, *@previous_row, 0] : [0, 1]
    @previous_row = bottom_row.each_cons(2).map { |left, right| left + right }
  end
end