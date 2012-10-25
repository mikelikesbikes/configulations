require 'hashie/mash'

class MagicHash < Hashie::Mash
  def initialize(source_hash = nil, default = nil, &blk)
    source_hash = fix_keys(source_hash) if source_hash
    super
  end

  private

  def fix_keys(hash)
    Hash[hash.map { |k,v|
      key = k.to_s.gsub("-", "_")
      value = v
      [key, value]
    }]
  end
end
