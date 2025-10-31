# Topic Outline: Test-Driven Development (TDD) - 1-Hour Lecture

## 1. Motivation for TDD (5 minutes)
- **Why TDD?**
  - Reducing bugs early in the development cycle
  - Improving code quality and design
  - Building confidence in code changes
  - Facilitating refactoring and long-term maintainability
- **Real-world examples of TDD benefits**
  - Case studies or anecdotes from industry

## 2. Definition of TDD (5 minutes)
- **What is TDD?**
  - A software development methodology where tests are written before the code
- **Core principles**
  - Red-Green-Refactor cycle
  - Writing only the code necessary to pass the test
- **Comparison with traditional testing**
  - Reactive testing vs proactive testing

## 3. Usual Format of TDD (5 minutes)
- **The Red-Green-Refactor cycle**
  - Red: Write a failing test
  - Green: Write the minimal code to pass the test
  - Refactor: Improve the code while ensuring tests still pass
- **Example walkthrough**
  - Simple code example (e.g., a function to calculate Fibonacci numbers)

## 4. Introduction to Automated Testing (5 minutes)
- **What is automated testing?**
  - Writing scripts to validate code functionality
- **Benefits of automation**
  - Speed, repeatability, and reliability
- **Common tools for automated testing**
  - Examples: JUnit, RSpec, PyTest, ExUnit

## 5. Automated Test Types and Tradeoffs (10 minutes)
- **Types of automated tests**
  - Unit tests
  - Integration tests
  - End-to-end (E2E) tests
- **Tradeoffs**
  - Cost: Time and resources to write and maintain tests
  - Effectiveness: Coverage and reliability
  - Recommended use-cases:
    - Unit tests for core logic
    - Integration tests for module interactions
    - E2E tests for user flows
- **Test pyramid**
  - Emphasis on having more unit tests than E2E tests

## 6. Typical Examples of Unit Tests and LiveView Tests (5 minutes)

- **Unit Test Example**
  - Testing a simple function:
    ```elixir
    # lib/math.ex
    defmodule Math do
      def add(a, b), do: a + b
    end

    # test/math_test.exs
    defmodule MathTest do
      use ExUnit.Case

      test "adds two numbers" do
        assert Math.add(2, 3) == 5
      end
    end
    ```

- **LiveView Test Example**
  - Testing a LiveView component:
    ```elixir
    # lib/my_app_web/live/counter_live.ex
    defmodule MyAppWeb.CounterLive do
      use MyAppWeb, :live_view

      def render(assigns) do
        ~H"""
        <div id="counter">
          <h1>Count: <%= @count %></h1>
          <button phx-click="increment">Increment</button>
        </div>
        """
      end

      def mount(_params, _session, socket) do
        {:ok, assign(socket, count: 0)}
      end

      def handle_event("increment", _value, socket) do
        {:noreply, assign(socket, count: socket.assigns.count + 1)}
      end
    end

    # test/my_app_web/live/counter_live_test.exs
    defmodule MyAppWeb.CounterLiveTest do
      use MyAppWeb.ConnCase
      import Phoenix.LiveViewTest

      test "increments the counter", %{conn: conn} do
        {:ok, view, _html} = live(conn, "/counter")

        assert render(view) =~ "Count: 0"
        view |> element("button", "Increment") |> render_click()
        assert render(view) =~ "Count: 1"
      end
    end
    ```

## 7. Using AI for Writing Tests (5 minutes)
- **How AI can assist in test generation**
  - Generating test cases from code
  - Identifying edge cases
- **Tools and platforms**
  - Examples: GitHub Copilot, ChatGPT, Codex
- **Limitations**
  - Human review is still necessary

## 7. Using AI for TDD (5 minutes)
- **AI-assisted TDD workflow**
  - Generating initial test cases
  - Suggesting code implementations for failing tests
- **Benefits**
  - Accelerating the Red-Green-Refactor cycle
  - Reducing cognitive load
- **Challenges**
  - Ensuring AI-generated code aligns with project requirements

## 8. TDD Variations (10 minutes)
- **Test && Commit || Revert (TCR)**
  - Definition and workflow
  - Differences from traditional TDD
- **Behavior-Driven Development (BDD)**
  - Focus on user behavior and scenarios
  - Tools: Cucumber, SpecFlow
- **Acceptance Test-Driven Development (ATDD)**
  - Collaboration between developers, testers, and stakeholders
  - Writing acceptance criteria as tests
- **When to use variations**
  - Project-specific considerations

## 9. Q&A and Closing Remarks (5 minutes)
- **Recap of key points**
  - Motivation, definition, and workflow of TDD
  - Role of automated testing and AI
  - Variations and their use-cases
- **Encourage further exploration**
  - Recommended resources: books, courses, and tools
- **Open floor for questions**

---
**Estimated Time Breakdown:**
- Lecture: 50 minutes
- Q&A: 10 minutes