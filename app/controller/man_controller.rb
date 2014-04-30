class ManController <UIViewController
  def viewDidLoad
    super

    @button = Base.style(UIButton.custom, {title: 'Apple', frame: [[10,30],[300,50]], backgroundColor: :lightgray.uicolor})
    @button2 = Base.style(UIButton.custom, {title: 'UI', frame: [[10,90],[300,50]], backgroundColor: :lightgray.uicolor})


    @button.when(UIControlEventTouchUpInside) do
      UIAlertView.alert("Get!")
      @queue = NSOperationQueue.new
      operation = ManModel.new.set_detail(1, @queue)
      @queue.addOperation(operation)
    end

    @button2.when(UIControlEventTouchUpInside) do
      UIAlertView.alert("OK")
    end
    self.view.addSubview(@button)
    self.view.addSubview(@button2)

  end
end