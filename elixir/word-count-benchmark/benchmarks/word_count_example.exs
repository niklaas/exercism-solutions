sentences =
    """
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lobortis imperdiet aliquam. Aliquam dignissim dolor et ornare viverra. Vivamus vel ex ligula. Proin ultricies sapien ac odio vulputate tempus. Phasellus vel dolor vulputate, tristique risus ac, ultrices enim. Proin non libero quis tortor ultrices porttitor in eu nunc. Vestibulum in lorem turpis. Pellentesque massa ante, varius vehicula eleifend congue, sagittis in dolor. Cras commodo orci vel nunc ullamcorper, id finibus diam vulputate. Nullam hendrerit libero ut eros cursus, ut pretium quam sollicitudin.

    Phasellus eu sapien id dolor lobortis bibendum. Quisque ornare eleifend pellentesque. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In nisi nulla, consequat sit amet iaculis malesuada, commodo ut magna. Etiam in sapien ut diam tempor ornare. Sed dictum sodales ultricies. Sed rhoncus pellentesque iaculis. Nullam a dolor neque. Maecenas dictum elementum venenatis. Nam pharetra rhoncus dolor. Phasellus a dolor accumsan, tincidunt mi sit amet, scelerisque est.

    Phasellus quis tincidunt nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer blandit egestas sem, eget porttitor magna egestas eget. Nunc sollicitudin sed sapien in accumsan. Quisque at tincidunt est. Sed facilisis bibendum velit, non ornare dui porttitor in. Praesent facilisis luctus erat, in interdum purus imperdiet at. Integer luctus lorem enim, sit amet consequat risus ornare eu. Sed condimentum fermentum purus sit amet pulvinar. Phasellus in arcu mauris. Ut ut augue sit amet leo cursus fringilla. Curabitur efficitur volutpat sem, id malesuada nisi tristique ac. Praesent massa massa, suscipit sed mi ut, egestas iaculis ex. Nullam interdum lectus condimentum quam sagittis, at vehicula arcu lacinia. Aliquam non mattis neque.

    Donec et risus commodo, fringilla mi at, egestas neque. Sed lacinia metus quis neque fermentum, at laoreet sem dignissim. Aliquam laoreet, lacus aliquam tincidunt volutpat, justo ante bibendum enim, pretium varius est tellus quis neque. Fusce fermentum augue a tortor tristique, et consectetur nibh posuere. Donec tempor, elit ac euismod viverra, nibh justo ornare ipsum, eu tempus justo purus id lectus. Donec eu justo enim. Etiam volutpat dapibus nunc vel pulvinar.

    Mauris sed lobortis justo. Vivamus pretium efficitur orci, at blandit ligula porta luctus. Mauris nec ipsum sed magna pharetra eleifend sed quis metus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut lobortis tincidunt turpis. Integer nec arcu in nisl consequat posuere. Nunc gravida justo sed diam vestibulum, sit amet congue risus porta. Suspendisse vel metus facilisis, aliquam massa quis, iaculis risus. Sed faucibus aliquam sodales. Etiam hendrerit volutpat ligula, non condimentum diam pulvinar eget. Quisque sagittis mi a pellentesque sodales. Proin congue, ante at placerat consequat, sapien nibh posuere urna, sed rhoncus ante sapien nec massa.
    """

Benchee.run(%{
  "WordsReduceRegex"  => fn -> WordsReduceRegex.count(sentences) end,
  "WordsReduce"  => fn -> WordsReduce.count(sentences) end,
  "WordsGroup"   => fn -> WordsGroup.count(sentences) end
})
