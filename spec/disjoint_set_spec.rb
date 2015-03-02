require 'spec_helper'

describe DisjointSet::DisjointSet do
  let(:d1) { DisjointSet::DisjointSet.new [1, 2, 3, 4] }

  it { is_expected.to respond_to(:parent) }
  it { is_expected.to respond_to(:rank) }

  it { expect(d1.parent).to eq({1 => 1, 2 => 2, 3 => 3, 4 => 4}) }
  it { expect(d1.rank).to eq({1 => 0, 2 => 0, 3 => 0, 4 => 0}) }

  describe '#make_set' do
    before { d1.make_set 5 }
    it { expect(d1.parent[5]).to eq(5) }
    it { expect(d1.rank[5]).to eq(0) }
  end

  describe '#union' do
    before { d1.union 1, 2 }

    it { expect(d1.parent[1]).to eq(1) }
    it { expect(d1.parent[2]).to eq(1) }
    it { expect(d1.rank[1]).to eq(1) }
    it { expect(d1.rank[2]).to eq(0) }

    describe 'lower rank set is unioned with higher rank set' do
      before { d1.union 3, 1 }

      it { expect(d1.parent[1]).to eq(1) }
      it { expect(d1.parent[3]).to eq(1) }
      it { expect(d1.rank[1]).to eq(1) }
      it { expect(d1.rank[3]).to eq(0) }
    end

    describe 'set\'s root is unioned' do
      before do
        d1.union 3, 4
        d1.union 1, 4
      end

      it { expect(d1.parent[3]).to eq(1) }
    end
  end

  describe '#find' do
    before { d1.union 1, 2 }

    it { expect(d1.parent[1]).to eq(1) }
    it { expect(d1.parent[2]).to eq(1) }

    describe 'when having rebuildable set' do
      before do
        d1.union 3, 4
        d1.union 1, 3
      end

      it { expect(d1.parent[4]).to eq(3) }

      describe 'after find' do
        before { d1.find 4 }

        it { expect(d1.parent[4]).to eq(1) }
      end
    end
  end

  describe '#same?' do
    it { expect(d1.same?(1, 2)).to eq(false) }

    describe 'after union' do
      before { d1.union 1, 2 }

      it { expect(d1.same?(1, 2)).to eq(true) }
    end
  end
end
