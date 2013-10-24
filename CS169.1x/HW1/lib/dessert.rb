class Dessert

  attr_accessor :name, :calories

  def initialize(name, calories)
    # your code here
    @name = name
    @calories = calories
  end

  def healthy?
    # your code here
    if @calories > 200
	false
    else
	true
    end
  end

  def delicious?
    # your code here
    if @name =~ /licorice/
	false
    else
	true
    end
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    # your code here
    super "#{flavor} jelly bean",5
  end
end
