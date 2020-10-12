require 'spec_helper'
require_relative '../quick_union/quick_union'

RSpec.describe QuickUnion do
    it "initializes with number of nodes" do
        uf = described_class.new(5)

        expect(uf.nodes.count).to eq(5)
    end

    it "connects nodes" do
        uf = described_class.new(5)

        uf.union(1,2)
        uf.union(0,4)
        expect(uf.connected?(1,2)).to eq(true)
        expect(uf.connected?(0,4)).to eq(true)
    end

    it "connects more than two nodes together" do
        uf = described_class.new(5)

        uf.union(1,2)
        uf.union(3,4)
        uf.union(1,4)

        expect(uf.connected?(1,2)).to eq(true)
        expect(uf.connected?(3,4)).to eq(true)
        expect(uf.connected?(1,4)).to eq(true)
        expect(uf.connected?(2,3)).to eq(true)
        expect(uf.connected?(0, 1)).to eq(false)
    end
end
