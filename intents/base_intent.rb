class BaseIntent
  def match?(_texto)
    false
  end

  def execute(_usuario, _texto)
    raise NotImplementedError
  end
end
