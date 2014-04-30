class ManModel < NSOperation

  include CDQ

  def set_detail(counter, queue)
    @counter = counter
    @queue = queue
    self
  end

  def main
    p "Main man"
    cdq.contexts.new(NSConfinementConcurrencyType) do
      5_000.times do |i|
        man = Man.create({
            name: "Man #{i}"
                   })
        # 1.
        # apple = Apple.create({
        #     name: "Apple #{i}"
        #                      })
        # 1. 3.
        apple = man.apples.create({
            name: "Apple #{i}"
                             })
        # 3.
        # reference ok
        # cdq.save
      end
      # 3.
      # reference explosion
      cdq.save
    end
    if @counter <= 3
      operation = ManModel.new.set_detail(@counter + 1, @queue)
      @queue.addOperation(operation)
    end
  end
end