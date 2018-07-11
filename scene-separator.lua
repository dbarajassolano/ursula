return {
  {
    Str = function (elem)
      if elem.text == "{{scene-break}}" then
        return pandoc.RawInline("latex","\\centerline{\\#}")
      else
        return elem
      end
    end,
  }
}